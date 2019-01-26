require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super
  end

  def draw
    Nyle.draw_text( 80,  70, "Nyle", {size: 16})
    Nyle.draw_text(140,  70, "Nyle", {size: 24})
    Nyle.draw_text(220,  70, "Nyle", {size: 32})
    Nyle.draw_text(320,  70, "Nyle", {size: 40})
    Nyle.draw_text(440,  70, "Nyle", {size: 48})

    Nyle.draw_text( 80, 120, "Nyle", {size: 16, a: 1.0})
    Nyle.draw_text(140, 120, "Nyle", {size: 24, a: 0.8})
    Nyle.draw_text(220, 120, "Nyle", {size: 32, a: 0.6})
    Nyle.draw_text(320, 120, "Nyle", {size: 40, a: 0.4})
    Nyle.draw_text(440, 120, "Nyle", {size: 48, a: 0.2})

    Nyle.draw_text( 80, 170, "Nyle", {size: 16, color: :RED})
    Nyle.draw_text(140, 170, "Nyle", {size: 24, color: :RED})
    Nyle.draw_text(220, 170, "Nyle", {size: 32, color: :RED})
    Nyle.draw_text(320, 170, "Nyle", {size: 40, color: :RED})
    Nyle.draw_text(440, 170, "Nyle", {size: 48, color: :RED})

    Nyle.draw_text( 80, 220, "Nyle", {size: 16, color: :FOREST_GREEN})
    Nyle.draw_text(140, 220, "Nyle", {size: 24, color: :FOREST_GREEN})
    Nyle.draw_text(220, 220, "Nyle", {size: 32, color: :FOREST_GREEN})
    Nyle.draw_text(320, 220, "Nyle", {size: 40, color: :FOREST_GREEN})
    Nyle.draw_text(440, 220, "Nyle", {size: 48, color: :FOREST_GREEN})

    Nyle.draw_text( 80, 270, "Nyle", {size: 16, color: :COBALT})
    Nyle.draw_text(140, 270, "Nyle", {size: 24, color: :COBALT})
    Nyle.draw_text(220, 270, "Nyle", {size: 32, color: :COBALT})
    Nyle.draw_text(320, 270, "Nyle", {size: 40, color: :COBALT})
    Nyle.draw_text(440, 270, "Nyle", {size: 48, color: :COBALT})

    Nyle.draw_text( 80, 320, "Nyle", {size: 16, color: :GOLD})
    Nyle.draw_text(140, 320, "Nyle", {size: 24, color: :GOLD})
    Nyle.draw_text(220, 320, "Nyle", {size: 32, color: :GOLD})
    Nyle.draw_text(320, 320, "Nyle", {size: 40, color: :GOLD})
    Nyle.draw_text(440, 320, "Nyle", {size: 48, color: :GOLD})

    Nyle.draw_text( 80, 390, "minimal graphics framework", {size: 24, a: 0.8})
    Nyle.draw_text(110, 420, "using Ruby/GTK3 and rcairo",   {size: 24, a: 0.8})

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end
end


Screen.new.show_all
Gtk.main

