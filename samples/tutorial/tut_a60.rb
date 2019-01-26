require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super
    @x = 320
    @y = 240
  end
  def draw
    Nyle.draw_circle(@x,      @y,      50)
    Nyle.draw_circle(@x,      @y,      50, {fill: true, color: :PEACH_YELLOW})
    Nyle.draw_circle(@x - 20, @y - 10,  8, {fill: true})
    Nyle.draw_circle(@x + 20, @y - 10,  8, {fill: true})
    Nyle.draw_circle(@x - 18, @y - 10,  2, {fill: true, color: :WHITE})
    Nyle.draw_circle(@x + 18, @y - 10,  2, {fill: true, color: :WHITE})
    Nyle.draw_circle(@x,      @y + 25,  5)
  end
  def update
    if Nyle.mask_shift?
      @x += Nyle.cursor_x * 5
      @y += Nyle.cursor_y * 5
    else
      @x += Nyle.cursor_x
      @y += Nyle.cursor_y
    end
  end
end

Screen.new.show_all
Gtk.main
