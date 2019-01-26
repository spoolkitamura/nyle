require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super
  end
  def draw
    Nyle.draw_circle(320, 240, 50)
  end
end

Screen.new.show_all
Gtk.main
