
require 'nyle'

module Points
  def star(x, y)
    [
     [x,      y - 50],
     [x + 14, y - 20],
     [x + 47, y - 15],
     [x + 23, y +  7],
     [x + 29, y + 40],
     [x,      y + 25],
     [x - 29, y + 40],
     [x - 23, y +  7],
     [x - 47, y - 15],
     [x - 14, y - 20]
    ]
  end

  def para_star(x, y)
    rl, rm, rs = 70, 50, 30       # radius(large, middle, small)
    count = 10
    angle = 360.0 / (count * 4)   # central angle of each vertex
    deg = Math::PI / 180.0

    points = []
    for i in 1..count
      points << [x + rs * Math.cos((i * 4 - 3) * angle * deg), y + rs * Math.sin((i * 4 - 3) * angle * deg)]
      points << [x + rm * Math.cos((i * 4 - 2) * angle * deg), y + rm * Math.sin((i * 4 - 2) * angle * deg)]
      points << [x + rs * Math.cos((i * 4 - 1) * angle * deg), y + rs * Math.sin((i * 4 - 1) * angle * deg)]
      points << [x + rl * Math.cos((i * 4 - 0) * angle * deg), y + rl * Math.sin((i * 4 - 0) * angle * deg)]
    end
    points
  end

  def wave(x, y)
    points = []
    for deg in 0..(360 * 5)
      th = -deg * (Math::PI / 180)
      points << [deg / 5 + x, Math.sin(th) * 20 + y]
    end
    points
  end
end


class Screen < Nyle::Screen
  include Points
  def initialize
    super
  end
  def draw
     Nyle.draw_shape(star(120, 100), {color: :GOLD,         weight: 5, close: true})
     Nyle.draw_shape(star(280, 100), {color: :GOLD,         weight: 5, close: true, fill: true})
     Nyle.draw_shape(star(440, 100), {color: :GOLD, a: 0.5, weight: 5, close: true, fill: true})

     Nyle.draw_shape(para_star(120, 240), {color: :BROWN,         weight: 3, close: true})
     Nyle.draw_shape(para_star(280, 240), {color: :BROWN,         weight: 3, close: true, fill: true})
     Nyle.draw_shape(para_star(440, 240), {color: :BROWN, a: 0.8, weight: 3, close: true, fill: true})

     Nyle.draw_shape(wave(100, 360), {color: :SKY_BLUE, weight: 5, cap: :ROUND})
     Nyle.draw_shape(wave(100, 410), {color: :SKY_BLUE, weight: 5, cap: :ROUND, fill: true})

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end
end

Screen.new.show_all
Gtk.main

