
require 'nyle'

class Screen < Nyle::Screen

  def initialize
    super(500, 400, {trace: true})
    @color = :BLUE
    @png   = false
  end

  def draw
    Nyle.draw_circle(Nyle.mouse_x, Nyle.mouse_y, 10, {color: @color, fill: true}) if Nyle.mouse_down?(MOUSE_L)   # draw  (left-click)
    Nyle.draw_circle(Nyle.mouse_x, Nyle.mouse_y, 10, {color: :WHITE, fill: true}) if Nyle.mouse_down?(MOUSE_R)   # erase (right-click)

    Nyle.draw_text( 10,  20, "[mouse left ]  draw",  {size: 16})
    Nyle.draw_text( 10,  40, "[mouse right]  erase", {size: 16})

    if @png
      Nyle.save_image("./sketch.png")
      @png = false
    end

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end

  def change_color(color)
    @color = color
  end

  def save_pngfile
    # Don't write 'Nyle.save_image' method here
    # Here is out of range about CairoContext
    @png = true
  end
end


class Frame < Nyle::Frame
  def initialize
    super(600, 400)

    # screen
    screen = Screen.new

    # buttons
    vbox = Gtk::Box.new(:vertical)
    vbox.pack_start(button_r    = Gtk::RadioButton.new(                  label: 'Red'),   padding:  3)
    vbox.pack_start(button_g    = Gtk::RadioButton.new(member: button_r, label: 'Green'), padding:  3)
    vbox.pack_start(button_b    = Gtk::RadioButton.new(member: button_r, label: 'Blue'),  padding:  3)
    vbox.pack_start(button_save = Gtk::Button.new(label: 'Save file'),                    padding: 10)

    # default active button (:BLUE)
    button_b.active = true

    # foreground color
    button_r.override_color(:normal, _color_conv(:RED))
    button_g.override_color(:normal, _color_conv(:FOREST_GREEN))
    button_b.override_color(:normal, _color_conv(:BLUE))

    # pack
    hbox = Gtk::Box.new(:horizontal)
    hbox.pack_start(vbox,   expand: false, fill: true, padding: 0)   # buttons
    hbox.pack_start(screen, expand: true,  fill: true, padding: 0)   # screen
    self.set_current(hbox)

    # signal handlers
    button_r.signal_connect(:toggled) do      # change color to RED
      screen.change_color(:RED)
    end

    button_g.signal_connect(:toggled) do      # change color to GREEN
      screen.change_color(:FOREST_GREEN)
    end

    button_b.signal_connect(:toggled) do      # change color to BLUE
      screen.change_color(:BLUE)
    end

    button_save.signal_connect(:clicked) do   # save *.png file
      screen.save_pngfile
    end
  end

  private def _color_conv(color)
    Gdk::RGBA.new(Cairo::Color.parse(color).r,
                  Cairo::Color.parse(color).g,
                  Cairo::Color.parse(color).b,
                  Cairo::Color.parse(color).a)
  end
end


Frame.new.show_all
Gtk.main

