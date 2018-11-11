
require 'nyle'

class Screen < Nyle::Screen
  include Nyle
  def initialize
    super
    @image1 = load_image("./image/n_b_crocodile.png")
    @image2 = load_image("./image/n_b_river.gif")
  end

  def draw
    # line
    draw_line( 40, 100,  70, 10)
    draw_line( 80, 100, 110, 10, {weight: 10})
    draw_line(120, 100, 150, 10, {weight: 10, cap: :ROUND})
    for a in (1..10)
      draw_line(120 + a * 40, 100, 150 + a * 40, 10, {weight: 10, cap: :ROUND, color: :DARK_GREEN, a: a / 10.0})
    end

    # circle
    draw_circle( 70, 150, 30)
    draw_circle(170, 150, 30, {weight: 5})
    draw_circle(270, 150, 30, {weight: 5, color: :ORANGE})
    draw_circle(370, 150, 30, {color: :ORANGE, fill: true, a: 0.6})

    # rectangle
    draw_rect( 40, 200, 60, 30)
    draw_rect(140, 200, 60, 30, {weight: 5})
    draw_rect(240, 200, 60, 30, {weight: 5, color: :ORANGE})
    draw_rect(340, 200, 60, 30, {color: :ORANGE, fill: true, a: 0.6})
    draw_rect(440, 200, 60, 30, {weight: 5, color: :ORANGE, round: 5})
    draw_rect(540, 200, 60, 30, {color: :ORANGE, fill: true, round: 5, a: 0.6})

    draw_rect( 45, 250, 50, 30, {weight: 3, color: :GOLD})
    cr.save do
      for i in (1..5) do
        # rectangle (coordinate transformation)
        rotate(Math::PI / 80)
        translate(80, -10)
        scale(1.1, 1.1)
        draw_rect( 45, 250, 50, 30, {weight: 3, color: :GOLD, fill: true, round: 2})
      end
    end

    # text
    draw_text(40, 375, "【Nyle】", {color: :DARK_GREEN})
    draw_text(60, 410, " minimal graphics framework", {color: :DARK_GREEN, size: 24, a: 0.8})
    draw_text(70, 440, " using Ruby/GTK3 and Cairo",  {color: :DARK_GREEN, size: 24, a: 0.8})

    # image
    draw_image(470,  70, @image1)
    draw_image(440, 260, @image2)

    # key status
    puts "[ctrl] + [shift]" if mask_control? and mask_shift?

    # mouse status
    for k in (1..3)
      puts "mouse_press?(#{k})" if mouse_press?(k)
    end

    quit if key_press?(KEY_Escape)
  end
end


Screen.new.show_all
Gtk.main

