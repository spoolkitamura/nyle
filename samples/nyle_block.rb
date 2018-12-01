
require 'nyle'

class Blocks < Array
  def initialize
    colors = [
      :BLUE,
      :YELLOW,
      :WHITE,
      :RED,
      :GREEN
    ]
    colors.length.times do |y|
      10.times do |x|
        self << Block.new(21 + 60 * x , 21 + 20 * y, colors[y])
      end
    end
  end

  def draw
    self.each do |block|
      block.draw
    end
  end
end

class Block
  attr_accessor :x, :y, :width, :height
  def initialize(x, y, color)
    @x = x
    @y = y
    @width  = 58
    @height = 18
    @color  = color
  end

  def update
  end

  def draw
    Nyle.draw_rect(@x, @y, @width, @height, {color: @color, fill: true, round: 2})
  end
end

class Walls < Array
  def initialize
    self << Wall.new(  0, 0,  20, 480, :WHITE)
    self << Wall.new(  0, 0, 640,  20, :WHITE)
    self << Wall.new(620, 0,  20, 480, :WHITE)
  end

  def draw
    self.each do |wall|
      wall.draw
    end
  end
end

class Wall
  attr_accessor :x, :y, :width, :height
  def initialize(x, y, width, height, color)
    @x = x
    @y = y
    @width  = width
    @height = height
    @color  = color
  end
 
  def update
  end
 
  def draw
    Nyle.draw_rect(@x, @y, @width, @height, {color: @color, fill: true})
  end
end

class Paddle
  attr_accessor :x, :y, :width, :height
  def initialize(x, y)
    @x = x
    @y = y
    @width = 100
    @height = 20
  end
 
  def update(mx, my)
    @x = mx - @width / 2
  end

  def draw
    Nyle.draw_rect(@x, @y, @width, @height, {color: :WHITE, fill: true})
  end
end

class Ball
  def initialize(x, y)
    @x  =  x
    @y  =  y
    @r  = 10
    @dx =  5
    @dy = -5
  end

  def update(walls, blocks, paddle)
    @x +=@dx
    if _atari_array?(walls) or _atari?(paddle)
      @x -= @dx
      @dx *= -1
    end
 
    @y +=@dy
   if _atari_array?(walls) or _atari?(paddle)
      @y -= @dy
      @dy *= -1
    end
  
    blocks.delete_if do |block|
      if _atari?(block)
         @y -= @dy
         @dy *= -1
      end
    end
  end

  def draw
    Nyle.draw_circle(@x, @y, @r, {color: :WHITE, fill: true})
  end

  private def _atari?(aite)
    x0  = @x - @r
    xx0 = @x + @r
    y0  = @y - @r
    yy0 = @y + @r
    x   = aite.x
    xx  = aite.x + aite.width
    y   = aite.y
    yy  = aite.y + aite.height
 
    (x <= x0  && x0  <= xx ||
     x <= xx0 && xx0 <= xx) &&
    (y <= y0  && y0  <= yy ||
     y <= yy0 && yy0 <= yy)
  end

  private def _atari_array?(array)
    array.each do |a|
      if _atari?(a)
        return true
      end
    end
    false
  end
end


class Screen < Nyle::Screen
  def initialize
    super(640, 480, {bgcolor: :BLACK})
     setup
  end

  def setup
    @blocks = Blocks.new
    @walls  = Walls.new
    @paddle = Paddle.new(0, 460)
    @ball   = Ball.new(300, 400)
  end

  def draw
    @blocks.draw
    @walls.draw
    @paddle.draw
    @ball.draw
  end

  def update
    @paddle.update(Nyle.mouse_x, Nyle.mouse_y)
    @ball.update(@walls, @blocks, @paddle)

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end

end


Screen.new.show_all
Gtk.main

