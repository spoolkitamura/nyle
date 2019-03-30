require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super
  end

  def draw
    Nyle.draw_circle(120,  60, 30)
    Nyle.draw_circle(220,  60, 30, {weight:  4})
    Nyle.draw_circle(320,  60, 30, {weight:  6})
    Nyle.draw_circle(420,  60, 30, {weight:  8})
    Nyle.draw_circle(520,  60, 30, {weight: 10})

    Nyle.draw_circle(120, 130, 30, {fill: true, a: 0.2})
    Nyle.draw_circle(220, 130, 30, {fill: true, a: 0.4})
    Nyle.draw_circle(320, 130, 30, {fill: true, a: 0.6})
    Nyle.draw_circle(420, 130, 30, {fill: true, a: 0.8})
    Nyle.draw_circle(520, 130, 30, {fill: true, a: 1.0})

    Nyle.draw_circle(120, 200, 30, {fill: true, a: 0.2, color: :RED})
    Nyle.draw_circle(220, 200, 30, {fill: true, a: 0.4, color: :RED})
    Nyle.draw_circle(320, 200, 30, {fill: true, a: 0.6, color: :RED})
    Nyle.draw_circle(420, 200, 30, {fill: true, a: 0.8, color: :RED})
    Nyle.draw_circle(520, 200, 30, {fill: true, a: 1.0, color: :RED})

    Nyle.draw_circle(120, 270, 30, {fill: true, a: 0.2, color: :FOREST_GREEN})
    Nyle.draw_circle(220, 270, 30, {fill: true, a: 0.4, color: :FOREST_GREEN})
    Nyle.draw_circle(320, 270, 30, {fill: true, a: 0.6, color: :FOREST_GREEN})
    Nyle.draw_circle(420, 270, 30, {fill: true, a: 0.8, color: :FOREST_GREEN})
    Nyle.draw_circle(520, 270, 30, {fill: true, a: 1.0, color: :FOREST_GREEN})

    Nyle.draw_circle(120, 340, 30, {fill: true, a: 0.2, color: :COBALT})
    Nyle.draw_circle(220, 340, 30, {fill: true, a: 0.4, color: :COBALT})
    Nyle.draw_circle(320, 340, 30, {fill: true, a: 0.6, color: :COBALT})
    Nyle.draw_circle(420, 340, 30, {fill: true, a: 0.8, color: :COBALT})
    Nyle.draw_circle(520, 340, 30, {fill: true, a: 1.0, color: :COBALT})

    Nyle.draw_circle(120, 410, 30, {fill: true, a: 0.2, color: :GOLD})
    Nyle.draw_circle(220, 410, 30, {fill: true, a: 0.4, color: :GOLD})
    Nyle.draw_circle(320, 410, 30, {fill: true, a: 0.6, color: :GOLD})
    Nyle.draw_circle(420, 410, 30, {fill: true, a: 0.8, color: :GOLD})
    Nyle.draw_circle(520, 410, 30, {fill: true, a: 1.0, color: :GOLD})

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end
end


Screen.new.show_all
Nyle.main

