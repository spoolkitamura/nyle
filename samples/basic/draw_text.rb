require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super
  end

  def draw
    Nyle.draw_line( 20, 410, 620, 410, {color: :GRAY, a: 0.1})
    Nyle.draw_line( 20, 440, 620, 440, {color: :GRAY, a: 0.1})
    Nyle.draw_text( 80, 410, "minimal graphics framework", {size: 24})
    Nyle.draw_text(120, 440, "using Ruby/GTK3 and rcairo", {size: 24})

    Nyle.draw_line( 20,  50, 620,  50, {color: :GRAY, a: 0.1})
    Nyle.draw_text( 80,  50, "Nyle", {size: 18, font: "sans-serif"})
    Nyle.draw_text(140,  50, "Nyle", {size: 24, font: "sans-serif"})
    Nyle.draw_text(220,  50, "Nyle", {size: 32, font: "sans-serif", bold: true})
    Nyle.draw_text(320,  50, "Nyle", {size: 42, font: "sans-serif", italic: true})
    Nyle.draw_text(440,  50, "Nyle", {size: 48, font: "sans-serif", italic: true, bold: true})

    Nyle.draw_line( 20, 110, 620, 110, {color: :GRAY, a: 0.1})
    Nyle.draw_text( 80, 110, "Nyle", {size: 18, a: 1.0, font: "sans-serif"})
    Nyle.draw_text(140, 110, "Nyle", {size: 24, a: 0.8, font: "sans-serif"})
    Nyle.draw_text(220, 110, "Nyle", {size: 32, a: 0.6, font: "sans-serif", bold: true})
    Nyle.draw_text(320, 110, "Nyle", {size: 42, a: 0.4, font: "sans-serif", italic: true})
    Nyle.draw_text(440, 110, "Nyle", {size: 48, a: 0.2, font: "sans-serif", italic: true, bold: true})

    Nyle.draw_line( 20, 170, 620, 170, {color: :GRAY, a: 0.1})
    Nyle.draw_text( 80, 170, "Nyle", {size: 18, color: :RED, font: "serif"})
    Nyle.draw_text(140, 170, "Nyle", {size: 24, color: :RED, font: "serif"})
    Nyle.draw_text(220, 170, "Nyle", {size: 32, color: :RED, font: "serif", bold: true})
    Nyle.draw_text(320, 170, "Nyle", {size: 42, color: :RED, font: "serif", italic: true})
    Nyle.draw_text(440, 170, "Nyle", {size: 48, color: :RED, font: "serif", italic: true, bold: true})

    Nyle.draw_line( 20, 230, 620, 230, {color: :GRAY, a: 0.1})
    Nyle.draw_text( 80, 230, "Nyle", {size: 18, color: :FOREST_GREEN, font: "serif"})
    Nyle.draw_text(140, 230, "Nyle", {size: 24, color: :FOREST_GREEN, font: "serif"})
    Nyle.draw_text(220, 230, "Nyle", {size: 32, color: :FOREST_GREEN, font: "serif", bold: true})
    Nyle.draw_text(320, 230, "Nyle", {size: 42, color: :FOREST_GREEN, font: "serif", italic: true})
    Nyle.draw_text(440, 230, "Nyle", {size: 48, color: :FOREST_GREEN, font: "serif", italic: true, bold: true})

    Nyle.draw_line( 20, 290, 620, 290, {color: :GRAY, a: 0.1})
    Nyle.draw_text( 80, 290, "Nyle", {size: 18, color: :COBALT, font: "monospace"})
    Nyle.draw_text(140, 290, "Nyle", {size: 24, color: :COBALT, font: "monospace"})
    Nyle.draw_text(220, 290, "Nyle", {size: 32, color: :COBALT, font: "monospace", bold: true})
    Nyle.draw_text(320, 290, "Nyle", {size: 42, color: :COBALT, font: "monospace", italic: true})
    Nyle.draw_text(440, 290, "Nyle", {size: 48, color: :COBALT, font: "monospace", italic: true, bold: true})

    Nyle.draw_line( 20, 350, 620, 350, {color: :GRAY, a: 0.1})
    Nyle.draw_text( 80, 350, "Nyle", {size: 18, color: :GOLD, font: "monospace"})
    Nyle.draw_text(140, 350, "Nyle", {size: 24, color: :GOLD, font: "monospace"})
    Nyle.draw_text(220, 350, "Nyle", {size: 32, color: :GOLD, font: "monospace", bold: true})
    Nyle.draw_text(320, 350, "Nyle", {size: 42, color: :GOLD, font: "monospace", italic: true})
    Nyle.draw_text(440, 350, "Nyle", {size: 48, color: :GOLD, font: "monospace", italic: true, bold: true})

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end
end


Screen.new.show_all
Gtk.main

