require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super
  end

  def draw
    Nyle.draw_line( 40,  70, 100,  10)
    Nyle.draw_line( 90,  70, 150,  10, {weight:  4})
    Nyle.draw_line(140,  70, 200,  10, {weight:  6})
    Nyle.draw_line(190,  70, 250,  10, {weight:  8})
    Nyle.draw_line(240,  70, 300,  10, {weight: 10})
    Nyle.draw_line(310,  70, 370,  10, {            cap: :ROUND})
    Nyle.draw_line(360,  70, 420,  10, {weight:  4, cap: :ROUND})
    Nyle.draw_line(410,  70, 470,  10, {weight:  6, cap: :ROUND})
    Nyle.draw_line(460,  70, 520,  10, {weight:  8, cap: :ROUND})
    Nyle.draw_line(510,  70, 570,  10, {weight: 10, cap: :ROUND})

    Nyle.draw_line( 40, 150, 100,  90, {                         a: 0.2})
    Nyle.draw_line( 90, 150, 150,  90, {weight:  4             , a: 0.4})
    Nyle.draw_line(140, 150, 200,  90, {weight:  6             , a: 0.6})
    Nyle.draw_line(190, 150, 250,  90, {weight:  8             , a: 0.8})
    Nyle.draw_line(240, 150, 300,  90, {weight: 10             , a: 1.0})
    Nyle.draw_line(310, 150, 370,  90, {            cap: :ROUND, a: 0.2})
    Nyle.draw_line(360, 150, 420,  90, {weight:  4, cap: :ROUND, a: 0.4})
    Nyle.draw_line(410, 150, 470,  90, {weight:  6, cap: :ROUND, a: 0.6})
    Nyle.draw_line(460, 150, 520,  90, {weight:  8, cap: :ROUND, a: 0.8})
    Nyle.draw_line(510, 150, 570,  90, {weight: 10, cap: :ROUND, a: 1.0})

    Nyle.draw_line( 40, 230, 100, 170, {                         a: 0.2, color: :RED})
    Nyle.draw_line( 90, 230, 150, 170, {weight:  4             , a: 0.4, color: :RED})
    Nyle.draw_line(140, 230, 200, 170, {weight:  6             , a: 0.6, color: :RED})
    Nyle.draw_line(190, 230, 250, 170, {weight:  8             , a: 0.8, color: :RED})
    Nyle.draw_line(240, 230, 300, 170, {weight: 10             , a: 1.0, color: :RED})
    Nyle.draw_line(310, 230, 370, 170, {            cap: :ROUND, a: 0.2, color: :RED})
    Nyle.draw_line(360, 230, 420, 170, {weight:  4, cap: :ROUND, a: 0.4, color: :RED})
    Nyle.draw_line(410, 230, 470, 170, {weight:  6, cap: :ROUND, a: 0.6, color: :RED})
    Nyle.draw_line(460, 230, 520, 170, {weight:  8, cap: :ROUND, a: 0.8, color: :RED})
    Nyle.draw_line(510, 230, 570, 170, {weight: 10, cap: :ROUND, a: 1.0, color: :RED})

    Nyle.draw_line( 40, 310, 100, 250, {                         a: 0.2, color: :FOREST_GREEN})
    Nyle.draw_line( 90, 310, 150, 250, {weight:  4             , a: 0.4, color: :FOREST_GREEN})
    Nyle.draw_line(140, 310, 200, 250, {weight:  6             , a: 0.6, color: :FOREST_GREEN})
    Nyle.draw_line(190, 310, 250, 250, {weight:  8             , a: 0.8, color: :FOREST_GREEN})
    Nyle.draw_line(240, 310, 300, 250, {weight: 10             , a: 1.0, color: :FOREST_GREEN})
    Nyle.draw_line(310, 310, 370, 250, {            cap: :ROUND, a: 0.2, color: :FOREST_GREEN})
    Nyle.draw_line(360, 310, 420, 250, {weight:  4, cap: :ROUND, a: 0.4, color: :FOREST_GREEN})
    Nyle.draw_line(410, 310, 470, 250, {weight:  6, cap: :ROUND, a: 0.6, color: :FOREST_GREEN})
    Nyle.draw_line(460, 310, 520, 250, {weight:  8, cap: :ROUND, a: 0.8, color: :FOREST_GREEN})
    Nyle.draw_line(510, 310, 570, 250, {weight: 10, cap: :ROUND, a: 1.0, color: :FOREST_GREEN})

    Nyle.draw_line( 40, 390, 100, 330, {                         a: 0.2, color: :COBALT})
    Nyle.draw_line( 90, 390, 150, 330, {weight:  4             , a: 0.4, color: :COBALT})
    Nyle.draw_line(140, 390, 200, 330, {weight:  6             , a: 0.6, color: :COBALT})
    Nyle.draw_line(190, 390, 250, 330, {weight:  8             , a: 0.8, color: :COBALT})
    Nyle.draw_line(240, 390, 300, 330, {weight: 10             , a: 1.0, color: :COBALT})
    Nyle.draw_line(310, 390, 370, 330, {            cap: :ROUND, a: 0.2, color: :COBALT})
    Nyle.draw_line(360, 390, 420, 330, {weight:  4, cap: :ROUND, a: 0.4, color: :COBALT})
    Nyle.draw_line(410, 390, 470, 330, {weight:  6, cap: :ROUND, a: 0.6, color: :COBALT})
    Nyle.draw_line(460, 390, 520, 330, {weight:  8, cap: :ROUND, a: 0.8, color: :COBALT})
    Nyle.draw_line(510, 390, 570, 330, {weight: 10, cap: :ROUND, a: 1.0, color: :COBALT})

    Nyle.draw_line( 40, 470, 100, 410, {                         a: 0.2, color: :GOLD})
    Nyle.draw_line( 90, 470, 150, 410, {weight:  4             , a: 0.4, color: :GOLD})
    Nyle.draw_line(140, 470, 200, 410, {weight:  6             , a: 0.6, color: :GOLD})
    Nyle.draw_line(190, 470, 250, 410, {weight:  8             , a: 0.8, color: :GOLD})
    Nyle.draw_line(240, 470, 300, 410, {weight: 10             , a: 1.0, color: :GOLD})
    Nyle.draw_line(310, 470, 370, 410, {            cap: :ROUND, a: 0.2, color: :GOLD})
    Nyle.draw_line(360, 470, 420, 410, {weight:  4, cap: :ROUND, a: 0.4, color: :GOLD})
    Nyle.draw_line(410, 470, 470, 410, {weight:  6, cap: :ROUND, a: 0.6, color: :GOLD})
    Nyle.draw_line(460, 470, 520, 410, {weight:  8, cap: :ROUND, a: 0.8, color: :GOLD})
    Nyle.draw_line(510, 470, 570, 410, {weight: 10, cap: :ROUND, a: 1.0, color: :GOLD})

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end
end


Screen.new.show_all
Gtk.main

