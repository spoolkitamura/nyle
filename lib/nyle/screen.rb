
=begin
    'Nyle'
      minimal graphics framework using Ruby/GTK3 and Cairo

      Copyright (c) 2018 Koki Kitamura
      Released under the MIT license
      https://opensource.org/licenses/mit-license.php
=end

module Nyle
  class Error < StandardError; end

  # Screen
  class Screen < Gtk::DrawingArea
    include Gdk::Keyval                       # Include key definication to omit 'Gdk::Keyval::' for subclass
    attr_reader :width, :height, :status
    def initialize(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT, bgcolor: :WHITE, trace: false)
      super()
      @width         = width
      @height        = height
      @trace         = trace
      @bgcolor       = bgcolor
      @running_count = 0
      @status        = nil

      # Draw to 'CairoContext' of ImageSurface once, and copy to 'CairoContext' of DrawingArea
      if @trace
        # specified color background
        # [WARN] Segmentation Fault happen after a while
        #data = sprintf("%02X%02X%02X%02X", Cairo::Color.parse(@bgcolor).b * 255,
        #                                   Cairo::Color.parse(@bgcolor).g * 255,
        #                                   Cairo::Color.parse(@bgcolor).r * 255, 255)   # Hex            (e.g. CC7700FF; b=CC, g=77, r=00, a=FF)
        #data = [data].pack("H*")                                                        # Pack as binary (e.g. \xCC\x77\x00\xFF)
        #@canvas = Cairo::ImageSurface.new(data * @width * @height, :ARGB32, @width, @height, @width * 4)
        @canvas = Cairo::ImageSurface.new(@width, @height)
      else
        # transparent background
        @canvas = Cairo::ImageSurface.new(@width, @height)
      end
      self.signal_connect(:configure_event) do |widget, event|
        ;   # For resizing and so on
      end

      self.signal_connect(:draw) do |widget, cairo_context|
        # Draw to 'CairoContext' of ImageSurface
        Cairo::Context.new(@canvas) do |cr|
          Nyle.module_eval {
            _set_cr(cr)
          }
          unless @trace                       # If not trace, fill screen each time
            Nyle.cr.set_source_color(@bgcolor)
            Nyle.cr.paint
          end
          update
          draw
        end
        # Copy to 'CairoContext' of DrawingArea
        Nyle.module_eval {
          _set_cr(cairo_context)
        }
        pattern = Cairo::SurfacePattern.new(@canvas)
        Nyle.cr.set_source(pattern)
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
          _set_mouse_pos(event.x, event.y)
        }
        false
      end
    end

    # When single screen, create frame to show self
    def show_all(title = DEFAULT_TITLE)
      f = Nyle::Frame.new(@width, @height, {title: title})
      f.set_current(self)

      # Workaround for Segmentation Fault when ImageSureface instance create by using RGBA32 data at Screen.initialize
      f.override_background_color(:normal, Gdk::RGBA::new(Cairo::Color.parse(@bgcolor).r,
                                                          Cairo::Color.parse(@bgcolor).g,
                                                          Cairo::Color.parse(@bgcolor).b, 1.0))
      f.show_all
      f
    end

    # Abstract methods to be overriden
    private def update  ; end
    private def draw    ; end
    private def suspend ; end
    private def resume  ; end
  end

end


# [TODO] :draw counter (for waiting, sleeping, idling)

