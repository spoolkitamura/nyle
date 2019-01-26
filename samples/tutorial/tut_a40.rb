require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super
  end
  def draw
    Nyle.draw_circle(320,      240,      50)
    Nyle.draw_circle(320,      240,      50, {fill: true, color: :PEACH_YELLOW})
    Nyle.draw_circle(320 - 20, 240 - 10,  8, {fill: true})
    Nyle.draw_circle(320 + 20, 240 - 10,  8, {fill: true})
    Nyle.draw_circle(320 - 18, 240 - 10,  2, {fill: true, color: :WHITE})
    Nyle.draw_circle(320 + 18, 240 - 10,  2, {fill: true, color: :WHITE})
    Nyle.draw_circle(320,      240 + 25,  5)
  end
end

Screen.new.show_all
Gtk.main
