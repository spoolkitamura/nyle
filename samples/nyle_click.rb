
require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super
    @image1 = Nyle.load_image("./image/n_f_strawberry.png")
    calc_xy
  end

  def draw
    Nyle.draw_image(@x, @y, @image1)
    calc_xy if clicked?
    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end

  def calc_xy
    @x = rand(Nyle.screen_width  - @image1.width)
    @y = rand(Nyle.screen_height - @image1.height)
  end

  def clicked?
    Nyle.mouse_press?(MOUSE_L)          and
    Nyle.mouse_x >= @x                  and
    Nyle.mouse_x <= @x + @image1.width  and
    Nyle.mouse_y >= @y                  and
    Nyle.mouse_y <= @y + @image1.height
  end
end


Screen.new.show_all
Gtk.main

