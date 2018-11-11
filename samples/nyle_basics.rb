
require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super
    @image1 = Nyle.load_image("./image/n_b_crocodile.png")
    @image2 = Nyle.load_image("./image/n_b_river.gif")
  end

  def draw
    # line
    Nyle.draw_line( 40, 100,  70, 10)
    Nyle.draw_line( 80, 100, 110, 10, {weight: 10})
    Nyle.draw_line(120, 100, 150, 10, {weight: 10, cap: :ROUND})
    for a in (1..10)
      Nyle.draw_line(120 + a * 40, 100, 150 + a * 40, 10, {weight: 10, cap: :ROUND, color: :DARK_GREEN, a: a / 10.0})
    end

    # circle
    Nyle.draw_circle( 70, 150, 30)
    Nyle.draw_circle(170, 150, 30, {weight: 5})
    Nyle.draw_circle(270, 150, 30, {weight: 5, color: :ORANGE})
    Nyle.draw_circle(370, 150, 30, {color: :ORANGE, fill: true, a: 0.6})

    # rectangle
    Nyle.draw_rect( 40, 200, 60, 30)
    Nyle.draw_rect(140, 200, 60, 30, {weight: 5})
    Nyle.draw_rect(240, 200, 60, 30, {weight: 5, color: :ORANGE})
    Nyle.draw_rect(340, 200, 60, 30, {color: :ORANGE, fill: true, a: 0.6})
    Nyle.draw_rect(440, 200, 60, 30, {weight: 5, color: :ORANGE, round: 5})
    Nyle.draw_rect(540, 200, 60, 30, {color: :ORANGE, fill: true, round: 5, a: 0.6})

    Nyle.draw_rect( 45, 250, 50, 30, {weight: 3, color: :GOLD})
    Nyle.cr.save do
      for i in (1..5) do
        # rectangle (coordinate transformation)
        Nyle.rotate(Math::PI / 80)
        Nyle.translate(80, -10)
        Nyle.scale(1.1, 1.1)
        Nyle.draw_rect( 45, 250, 50, 30, {weight: 3, color: :GOLD, fill: true, round: 2})
      end
    end

    # text
    Nyle.draw_text(40, 375, "【Nyle】", {color: :DARK_GREEN})
    Nyle.draw_text(60, 410, " minimal graphics framework", {color: :DARK_GREEN, size: 24, a: 0.8})
    Nyle.draw_text(70, 440, " using Ruby/GTK3 and Cairo",  {color: :DARK_GREEN, size: 24, a: 0.8})

    # image
    Nyle.draw_image(470,  70, @image1)
    Nyle.draw_image(440, 260, @image2)

    # key status
    puts "[ctrl] + [shift]" if Nyle.mask_control? and Nyle.mask_shift?

    # mouse status
    for k in (1..3)
      puts "Nyle.mouse_press?(#{k})" if Nyle.mouse_press?(k)
    end

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end
end


Screen.new.show_all
Gtk.main

