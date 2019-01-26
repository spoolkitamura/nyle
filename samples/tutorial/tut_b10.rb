require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super
    @image = Nyle.load_image("./img.jpg")
  end
  def draw
    Nyle.draw_image(0, 0, @image)
  end
end

Screen.new.show_all
Gtk.main
