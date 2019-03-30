
=begin
    'Nyle'
      minimal graphics framework using Ruby/GTK3 and rcairo

      Copyright (c) 2018 Koki Kitamura
      Released under the MIT license
      https://opensource.org/licenses/mit-license.php
=end

module Nyle
  class Error < StandardError; end

  # Frame
  class Frame < Gtk::Window
    attr_reader :current_screen
    # include Gdk::Keyval                            # Include key definication to omit 'Gdk::Keyval::' for subclass
    def initialize(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT)
      super()
      self.set_size_request(width, height)
      self.resizable = false
      self.title     = DEFAULT_TITLE
      @transition    = []                            # Screen transition table
      @interval_time = DEFAULT_INTERVAL              # milli seconds

      # Nyle main frame
      me = self
      Nyle.module_eval {
        _set_frame(me)
      }

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
        _quit
      end
    end

    def show_all(title: nil, interval: nil)
      super()
      self.title = title if title
      if ENV['NYLE_INTERVAL']
        @interval_time = ENV['NYLE_INTERVAL'].to_i
      elsif interval
        @interval_time = interval.to_i
      end
      @interval_time = MIN_INTERVAL if @interval_time < MIN_INTERVAL
      @interval_time = MAX_INTERVAL if @interval_time > MAX_INTERVAL

      @timer = GLib::Timer.new
      @timer.start

      GLib::Timeout.add(@interval_time, GLib::PRIORITY_HIGH) do
#        puts "#{@timer.elapsed[0]}" if @timer
        if @timer
          elapsed = (@timer.elapsed[0] * 1000).round
          Nyle.module_eval {
            _set_running_time(elapsed)
          }
          if @current_screen
            update
            @current_screen.queue_draw unless @current_screen.destroyed?
          end
          true
        else
          false
        end
      end
    end

    def close
      _quit
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

    private def _quit
      @timer.stop
      @timer = nil                    # as block returns false by this, GLib::Timeout will remove and not be called
      Nyle.module_eval{
        _clear_mouse_state
        _clear_key_state
        _clear_running_time
      }
      self.hide
      Gtk.main_quit
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

