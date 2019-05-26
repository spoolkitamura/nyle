require 'nyle'

class Walker
  RADIUS = 4
  def initialize(max_x, max_y, color = :YELLOW)
    @max_x = max_x
    @max_y = max_y
    @x = max_x / 2.0
    @y = max_y / 2.0
    @step = 5
    @color = color
  end

  # Randomly move up, down, left, right
  def move
    stepx = rand(3) - 1
    stepy = rand(3) - 1
    @x += stepx * @step
    @y += stepy * @step

    # x,y limitter
    @x = 0      if @x < 0
    @x = @max_x if @x > @max_x
    @y = 0      if @y < 0
    @y = @max_y if @y > @max_y
  end

  def draw
    Nyle.draw_circle(@x, @y, RADIUS, {color: @color, fill: true})
  end
end


class Screen < Nyle::Screen

  def initialize
    super(320, 240, {bgcolor: :BLACK, trace: true})
    @walker = Walker.new(@width, @height)
  end

  def draw
    @walker.draw
  end

  def update
    @walker.move
    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end

end


Screen.new.show_all({interval: 30})
Nyle.main

