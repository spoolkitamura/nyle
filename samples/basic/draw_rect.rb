require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super
  end

  def draw
    Nyle.draw_rect( 90,  40, 60, 40)
    Nyle.draw_rect(190,  40, 60, 40, {weight:  4})
    Nyle.draw_rect(290,  40, 60, 40, {weight:  6})
    Nyle.draw_rect(390,  40, 60, 40, {weight:  8})
    Nyle.draw_rect(490,  40, 60, 40, {weight: 10})

    Nyle.draw_rect( 90, 100, 60, 40, {round:   4})
    Nyle.draw_rect(190, 100, 60, 40, {round:   8})
    Nyle.draw_rect(290, 100, 60, 40, {round:  12})
    Nyle.draw_rect(390, 100, 60, 40, {round:  16})
    Nyle.draw_rect(490, 100, 60, 40, {round:  20})

    Nyle.draw_rect( 90, 160, 60, 40, {fill: true, a: 0.2})
    Nyle.draw_rect(190, 160, 60, 40, {fill: true, a: 0.4})
    Nyle.draw_rect(290, 160, 60, 40, {fill: true, a: 0.6})
    Nyle.draw_rect(390, 160, 60, 40, {fill: true, a: 0.8})
    Nyle.draw_rect(490, 160, 60, 40, {fill: true, a: 1.0})

    Nyle.draw_rect( 90, 220, 60, 40, {fill: true, a: 0.2, color: :RED})
    Nyle.draw_rect(190, 220, 60, 40, {fill: true, a: 0.4, color: :RED})
    Nyle.draw_rect(290, 220, 60, 40, {fill: true, a: 0.6, color: :RED})
    Nyle.draw_rect(390, 220, 60, 40, {fill: true, a: 0.8, color: :RED})
    Nyle.draw_rect(490, 220, 60, 40, {fill: true, a: 1.0, color: :RED})

    Nyle.draw_rect( 90, 280, 60, 40, {fill: true, a: 0.2, color: :FOREST_GREEN})
    Nyle.draw_rect(190, 280, 60, 40, {fill: true, a: 0.4, color: :FOREST_GREEN})
    Nyle.draw_rect(290, 280, 60, 40, {fill: true, a: 0.6, color: :FOREST_GREEN})
    Nyle.draw_rect(390, 280, 60, 40, {fill: true, a: 0.8, color: :FOREST_GREEN})
    Nyle.draw_rect(490, 280, 60, 40, {fill: true, a: 1.0, color: :FOREST_GREEN})

    Nyle.draw_rect( 90, 340, 60, 40, {fill: true, a: 0.2, color: :COBALT})
    Nyle.draw_rect(190, 340, 60, 40, {fill: true, a: 0.4, color: :COBALT})
    Nyle.draw_rect(290, 340, 60, 40, {fill: true, a: 0.6, color: :COBALT})
    Nyle.draw_rect(390, 340, 60, 40, {fill: true, a: 0.8, color: :COBALT})
    Nyle.draw_rect(490, 340, 60, 40, {fill: true, a: 1.0, color: :COBALT})

    Nyle.draw_rect( 90, 400, 60, 40, {fill: true, a: 0.2, color: :GOLD})
    Nyle.draw_rect(190, 400, 60, 40, {fill: true, a: 0.4, color: :GOLD})
    Nyle.draw_rect(290, 400, 60, 40, {fill: true, a: 0.6, color: :GOLD})
    Nyle.draw_rect(390, 400, 60, 40, {fill: true, a: 0.8, color: :GOLD})
    Nyle.draw_rect(490, 400, 60, 40, {fill: true, a: 1.0, color: :GOLD})

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end
end


Screen.new.show_all
Nyle.main

