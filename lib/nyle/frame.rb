
=begin
    'Nyle'
      minimal graphics framework using Ruby/GTK3 and Cairo

      Copyright (c) 2018 Koki Kitamura
      Released under the MIT license
      https://opensource.org/licenses/mit-license.php
=end

module Nyle
  class Error < StandardError; end

  # Frame
  class Frame < Gtk::Window
    include Gdk::Keyval                            # Include key definication to omit 'Gdk::Keyval::' for subclass
    def initialize(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT, title: DEFAULT_TITLE)
      super()
      self.set_size_request(width, height)
      self.resizable = false
      self.title     = title
      @transition    = []                          # Screen transition table
      @interval_time = ENV['NYLE_INTERVAL'].to_i   # milli seconds
      @interval_time = 15 if @interval_time < 5 or @interval_time > 60
      GLib::Timeout.add(@interval_time) do
        if @current_screen
          update
          @current_screen.queue_draw unless @current_screen.destroyed?
        end
      end

      # Mouse events
      self.add_events([:button_press_mask,
                       :button_release_mask])

      # Signal handler for mouse pressed
      self.signal_connect(:button_press_event) do |widget, event|
        Nyle.module_eval {
          _set_mouse_down(event.button, true)
        }
        false
      end

      # Signal handler for mouse released
      self.signal_connect(:button_release_event) do |widget, event|
        Nyle.module_eval {
          _set_mouse_down(event.button, false)
        }
        false
      end

      # Signal handler for key pressed
      self.signal_connect(:key_press_event) do |widget, event|
        Nyle.module_eval {
          _set_key_down(event.keyval, true)
        }
        # [debug]
        # puts "keyname: [#{Gdk::Keyval.to_name(event.keyval)}]"
        false
      end

      # Signal handler for key released
      self.signal_connect(:key_release_event) do |widget, event|
        Nyle.module_eval {
          _set_key_down(event.keyval, false)
        }
        false
      end

      self.signal_connect(:destroy) do
        Gtk.main_quit
      end
    end

    def set_current(screen)
      _set_current(screen)
    end

    private def _set_current(widget)
      if widget.is_a?(Nyle::Screen)
        self.remove(@current_screen) if @current_screen
        @current_screen = widget
        self.add(@current_screen)     # add instance which is kind of Nyle::Screen
      else
        screen = nil
        widget.each do |child|
          if child.is_a?(Nyle::Screen)
            screen = child            # get instance which is kind of Nyle::Screen from container
            break
          end
        end
        if screen
          self.remove(@current_screen) if @current_screen
          @current_screen = screen
          self.add(widget)            # add container
        end
      end
      w = @current_screen.width
      h = @current_screen.height
      Nyle.module_eval {
        _set_screen_size(w, h)
      }
    end

    private def update
      @transition.each do |tr|
        if tr[:current] == @current_screen and tr[:status] == @current_screen.status
          tr[:current].instance_eval { suspend }                  # Suspend for current screen
          tr[:next].instance_eval    { resume  }                  # Resume for next screen
          _set_current(tr[:next])                                 # Change screen
          self.show_all
        end
      end
    end
  end

end

