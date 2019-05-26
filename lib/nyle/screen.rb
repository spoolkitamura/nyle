
=begin
    'Nyle'
      minimal graphics framework using Ruby/GTK3 and rcairo

      Copyright (c) 2018 Koki Kitamura
      Released under the MIT license
      https://opensource.org/licenses/mit-license.php
=end

module Nyle
  class Error < StandardError; end

  # Screen
  class Screen < Gtk::DrawingArea
    class Layer < Cairo::ImageSurface
      @@layers = {}
      private_class_method :new   # refuse to make an instance using 'new' from outside, so 'create' instead.
      def initialize(w, h)
        super(w, h)
      end
      def self.create(id, w, h)
        #puts "#{id} #{w} #{h}"
        if @@layers.has_key?(id)
          @@layers[id]            # existing instance
        else
          layer = new(w, h)
          @@layers[id] = layer
          layer                   # new instance
        end
      end
      def self.clear
        @@layers.clear
      end
      def self.status
        p @@layers
      end
    end

    attr_reader :width, :height, :status
    def initialize(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT, bgcolor: :WHITE, trace: false)
      super()
      @width         = width
      @height        = height
      @trace         = trace
      @bgcolor       = bgcolor
      @running_count = 0
      @status        = nil

      Nyle.module_eval {
        _set_screen_size(width, height)
      }

      # Draw to 'CairoContext' of ImageSurface once, and copy to 'CairoContext' of DrawingArea
      @canvas = Cairo::ImageSurface.new(@width, @height)

      self.signal_connect(:configure_event) do |widget, event|
        ;   # For resizing and so on
      end

      self.signal_connect(:draw) do |widget, cairo_context|
        Nyle.module_eval {
          _update_mouse_state
          _update_key_state
        }
        # Draw to 'CairoContext' of ImageSurface
        Cairo::Context.new(@canvas) do |cr|
          Nyle.module_eval {
            _set_cr(cr)
          }
          unless @trace                       # If not trace, clear screen each time
            Nyle.save do
              Nyle.cr.set_operator(Cairo::Operator::CLEAR)
              Nyle.cr.paint
            end
          end
          update
          draw
        end
        # Copy to 'CairoContext' of DrawingArea
        Nyle.module_eval {
          _set_cr(cairo_context)
        }
        Nyle.cr.set_source_color(@bgcolor)
        Nyle.cr.paint
        Nyle.cr.set_source(@canvas, 0, 0)
        Nyle.cr.paint
        @running_count += 1
      end

      # Need not only :pointer_motion but also :button_press and :button_release
      self.add_events([:button_press_mask,
                       :button_release_mask,
                       :pointer_motion_mask])

      # Signal handler for mouse position
      self.signal_connect(:motion_notify_event) do |widget, event|
        Nyle.module_eval {
          _set_mouse_pos(event.x.to_i, event.y.to_i)
        }
        false
      end
    end

    # Clear
    def clear_screen
      Nyle.save do
        Nyle.cr.set_operator(Cairo::Operator::CLEAR)
        Nyle.cr.paint
      end
    end

    # When single screen, create frame to show self
    def show_all(title: nil, interval: nil)
      f = Nyle::Frame.new(@width, @height)
      f.set_current(self)
      f.show_all({title: title, interval: interval})
      f
    end

    # Syntax sugar for starting Nyle aplication
    def start(*args)
      self.setup
      self.show_all(*args)
      Nyle.main
    end


    # Abstract methods to be overriden
    def update  ; end
    def draw    ; end
    def suspend ; end
    def resume  ; end
    def setup   ; end
  end

end

