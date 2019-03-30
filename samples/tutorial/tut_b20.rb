require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super
    @image = Nyle.load_image("./img.jpg", {cx: 200, cy: 100, cw: 320, ch: 240})
  end
  def draw
    Nyle.draw_image(20, 20, @image)
  end
end

Screen.new.show_all
Nyle.main
