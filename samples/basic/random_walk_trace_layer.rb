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
    super(320, 240, {bgcolor: :BLACK, trace: false})
    @walker1 = Walker.new(@width, @height, :YELLOW)
    @walker2 = Walker.new(@width, @height, :GREEN)
    @walker3 = Walker.new(@width, @height, :BLUE)
    @walker4 = Walker.new(@width, @height, :RED)
  end

  def draw
    Nyle.layer(:L1) do
      @walker1.draw
      Nyle.draw_rect(0, 0, @width, @height, {fill: true, color: :BLACK, a: 0.02})
    end
    Nyle.layer(:L2) do
      @walker2.draw
    end
    Nyle.layer(:L3) do
      Nyle.clear
      @walker3.draw
    end
    @walker4.draw
  end

  def update
    @walker1.move
    @walker2.move
    @walker3.move
    @walker4.move
    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end

end


Screen.new.show_all({interval: 30})
Nyle.main

