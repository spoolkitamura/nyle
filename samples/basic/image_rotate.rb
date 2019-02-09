require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super({bgcolor: :ALICE_BLUE})
    @image1 = Nyle.load_image("../image/n_b_crocodile.png")
    @th = 0
  end

  def draw
    # image
    if Nyle.mouse_press?(MOUSE_L) or Nyle.key_press?(KEY_Left)
      @th += Math::PI / 2
      @th = 0 if @th >= Math::PI * 2
    end
    if Nyle.mouse_press?(MOUSE_R) or Nyle.key_press?(KEY_Right)
      @th -= Math::PI / 2
      @th = 0 if @th <= -Math::PI * 2
    end

    Nyle.save do
      Nyle.translate(320, 150)
      Nyle.rotate(@th)
      Nyle.draw_image(0,  0, @image1, {pos: :CORNER})
      Nyle.draw_circle(0, 0, 2, {color: :RED, fill: true})
    end

    Nyle.save do
      Nyle.translate(320, 350)
      Nyle.rotate(@th)
      Nyle.draw_image(0,  0, @image1, {pos: :CENTER})
      Nyle.draw_circle(0, 0, 2, {color: :RED, fill: true})
    end

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end
end


Screen.new.show_all
Gtk.main

