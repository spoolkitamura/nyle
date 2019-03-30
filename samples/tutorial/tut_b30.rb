require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super
    @image = Nyle.load_image("./img.jpg", {sx: 0.5, sy: 0.5})
  end
  def draw
    Nyle.draw_image(20, 20, @image)
  end
end

Screen.new.show_all
Nyle.main
