require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super
    @image = Nyle.load_image_tiles("./img.jpg", 4, 3, {sx: 0.5, sy: 0.5})
  end
  def draw
    3.times do |y|
      4.times do |x|
        Nyle.draw_image(20 + x * 100, 20 + y * 100, @image[x][y])
      end
    end
  end
end

Screen.new.show_all
Nyle.main
