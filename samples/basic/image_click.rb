require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super(480, 320, {bgcolor: :YELLOW_GREEN})
    @image = Nyle.load_image("../image/n_c_mogura.png")
    calc_xy
  end

  def draw
    Nyle.draw_image(@x, @y, @image)
    calc_xy if clicked?
    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end

  def calc_xy
    @x = rand(Nyle.screen_width  - @image.width)
    @y = rand(Nyle.screen_height - @image.height)
  end

  def clicked?
    Nyle.mouse_press?(MOUSE_L)         and
    Nyle.mouse_x >= @x                 and
    Nyle.mouse_x <= @x + @image.width  and
    Nyle.mouse_y >= @y                 and
    Nyle.mouse_y <= @y + @image.height
  end
end


Screen.new.show_all
Nyle.main

