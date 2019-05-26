require 'nyle'


class Slider
  def initialize(low, high, default)
    @low     = low
    @high    = high 
    @val     = default
    @label   = ""
  end

  def position(x, y)
    @x = x
    @y = y
    @rectx = @x + _map(@val, @low, @high, 0, 120)
    @recty = @y - 10
    self
  end

  def set_label(label)
    @label = label
    self
  end

  def value
    Nyle.draw_line(@x, @y, @x + 120, @y, {color: :GRAY, weight: 4})

    if Nyle.mouse_down?(MOUSE_L) and _dist(Nyle.mouse_x, Nyle.mouse_y, @rectx, @recty) < 20
      @rectx = Nyle.mouse_x - 5
    end
    @rectx = _constrain(@rectx, (@x..@x + 120))

    Nyle.draw_rect(@rectx, @recty, 10, 20, {color: :GRAY, fill: true})
    Nyle.draw_rect(@rectx, @recty, 10, 20, {color: :BLACK, weight: 1})

    @val = _map(@rectx, @x, @x + 120, @low, @high)
    Nyle.draw_text(@rectx, @recty - 5, "#{@val.to_i}", {size: 12})
    Nyle.draw_text(@x + 135, @y + 5, @label, {size: 12})

    return @val
  end

  private def _dist(x1, y1, x2, y2)
    diffx = x1 - x2
    diffy = y1 - y2
    Math.sqrt(diffx * diffx + diffy * diffy) 
  end

  private def _map(v, s1, e1, s2, e2)
    v = v.to_f if v.integer?
    (v - s1) / (e1 - s1) * (e2 - s2) + s2
  end

  private def _constrain(x, rang)
    minx = rang.min
    maxx = rang.max
    x = minx if x <= minx
    x = maxx if x >= maxx
    x
  end
end


class Screen < Nyle::Screen
  def initialize
    super(600, 400, {bgcolor: :WHITE})
    @time   = 0
    @wave   = []
    @points = []
    @slider = Slider.new(1, 20, 5).position(70, 50).set_label('N')
  end

  def draw
    @n = @slider.value.to_i

    Nyle.translate(150, 200)
    x = 0
    y = 0
    @n.times do |i|
      prevx = x
      prevy = y
      m = i * 2 + 1
      radius = 75 * (4 / (m * Math::PI))
      x += radius * Math.cos(m * @time)
      y += radius * Math.sin(m * @time)

      Nyle.draw_circle(prevx, prevy, radius, {color: :GRAY})
      Nyle.draw_line(prevx, prevy, x, y, {color: :BLACK})
    end

    @wave.unshift(y)
    Nyle.translate(200, 0)
    Nyle.draw_circle(x - 200, y, 2, {color: :RED})
    Nyle.draw_line(x - 200, y, 0, @wave[0], {color: :RED})
    (0...@wave.size).each do |i|
       @points << [i, @wave[i]]
    end
    Nyle.draw_shape(@points, {color: :BLUE})
    @points.clear

    @time += 0.05
    @wave.pop if @wave.size > 250

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end
end

Screen.new.show_all
Nyle.main

