require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super(240, 240, {bgcolor: :FOREST_GREEN})
    @radius = 0.42
  end

  def draw
    Nyle.scale(Nyle.screen_width, Nyle.screen_height);
    Nyle.translate(0.5, 0.5);

    Nyle.draw_circle(0, 0, @radius, {color: :WHITE, fill: true})
    Nyle.draw_circle(0, 0, @radius, {weight: 0.05})

    # clock ticks
    for i in (0...12) do 
      inset = (i % 3 == 0 ? 0.05 : 0.03)
      Nyle.draw_line((@radius - inset) * Math::cos(i * Math::PI / 6),
                     (@radius - inset) * Math::sin(i * Math::PI / 6),
                     (@radius)         * Math::cos(i * Math::PI / 6),
                     (@radius)         * Math::sin(i * Math::PI / 6), {cap: :ROUND, weight: inset})
    end

    # store the current time
    tm = Time.now
    # puts "#{tm.hour} #{tm.min} #{tm.sec}"

    # compute the angles of the indicators of our clock
    hours   = tm.hour * Math::PI /  6;
    minutes = tm.min  * Math::PI / 30;
    seconds = tm.sec  * Math::PI / 30;

    # draw the hours hand
    Nyle.draw_line(0, 0,  Math::sin(hours + minutes / 12) * (@radius * 0.5),
                         -Math::cos(hours + minutes / 12) * (@radius * 0.5), {cap: :ROUND, color: :FOREST_GREEN, weight: 0.05})

    # draw the minutes hand
    Nyle.draw_line(0, 0,  Math::sin(minutes + seconds / 60) * (@radius * 0.8),
                         -Math::cos(minutes + seconds / 60) * (@radius * 0.8), {cap: :ROUND, color: :BLUE, weight: 0.05})

    # draw the seconds hand
    Nyle.draw_line(0, 0,  Math::sin(seconds) * (@radius * 0.9),
                         -Math::cos(seconds) * (@radius * 0.9), {cap: :ROUND, color: :RED, weight: 0.05 / 3})

    # draw a little dot in the middle
    Nyle.draw_circle(0, 0, 0.05 / 2, {fill: true})

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end
end


Screen.new.show_all
Nyle.main

