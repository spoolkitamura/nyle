
require 'nyle'

class Dot
  FGCOLOR = :WHITE
  BGCOLOR = :BLACK
  SIZE  = 2
  SPEED = 2

  def initialize(x, y)
    @x = x
    @y = y
  end

  def move
    if Nyle.pixel?(@x, @y + SPEED, BGCOLOR)             # just below
      Nyle.draw_rect(@x, @y, SIZE, SIZE, {color: BGCOLOR, fill: true})
      @y = @y + SPEED
      return true if @y >= (240 - SPEED)
    elsif rand(2) == 0
      if Nyle.pixel?(@x - SPEED, @y + SPEED, BGCOLOR)   # bottom left
        Nyle.draw_rect(@x, @y, SIZE, SIZE, {color: BGCOLOR, fill: true})
        @y = @y + SPEED
        @x = @x - SPEED
        return true if @y >= (240 - SPEED)
      end
    else
      if Nyle.pixel?(@x + SPEED, @y + SPEED, BGCOLOR)   # bottom right
        Nyle.draw_rect(@x, @y, SIZE, SIZE, {color: BGCOLOR, fill: true})
        @y = @y + SPEED
        @x = @x + SPEED
        return true if @y >= (240 - SPEED)
      end
    end
    Nyle.draw_rect(@x, @y, SIZE, SIZE, {color: FGCOLOR, fill: true})
    return false
  end
end

class Screen < Nyle::Screen
  FGCOLOR = :GOLD
  BGCOLOR = :BLACK

  def initialize
    super(120, 240, {bgcolor: BGCOLOR, trace: true})
    @dots = []
  end

  def draw
    x, y = Nyle.mouse_x, Nyle.mouse_y
    Nyle.draw_circle(x, y, 5, {color: FGCOLOR, fill: true}) if Nyle.mouse_down?(MOUSE_L)
    Nyle.draw_circle(x, y, 5, {color: BGCOLOR, fill: true}) if Nyle.mouse_down?(MOUSE_R)
    @dots << Dot.new(rand(20) + 50, 0) if @dots.size <= 300   # create dots (limit = 300)
    @dots.delete_if do |dot|
      dot.move                                                # move dots
    end
    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end
end

Screen.new.show_all
Gtk.main

