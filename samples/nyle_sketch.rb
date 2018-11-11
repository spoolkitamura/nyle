
require 'nyle'

class Screen < Nyle::Screen

  def initialize
    super(600, 400, {trace: true})
    @color = :BLUE
  end

  def draw
    #printf "(%3d , %3d)   down:%6s   press:%6s   release:%6s\n",
    #         Nyle.mouse_x,
    #         Nyle.mouse_y,
    #         Nyle.mouse_down[1],
    #         Nyle.mouse_press[1],
    #         Nyle.mouse_release[1]

    Nyle.draw_circle(Nyle.mouse_x, Nyle.mouse_y, 10, {color: @color, fill: true}) if Nyle.mouse_down?(1)   # draw  (left-click)
    Nyle.draw_circle(Nyle.mouse_x, Nyle.mouse_y, 10, {color: :WHITE, fill: true}) if Nyle.mouse_down?(3)   # erase (right-click)

    Nyle.draw_text( 10,  20, "[mouse left ]  draw",       {size: 16})
    Nyle.draw_text( 10,  40, "[mouse right]  erase",      {size: 16})
    Nyle.draw_text( 10,  70, "[space]  save",             {size: 16})
    Nyle.draw_text( 10, 380, "[r]",                       {size: 28, color: :RED          })
    Nyle.draw_text( 50, 380, "[g]",                       {size: 28, color: :FOREST_GREEN })
    Nyle.draw_text( 90, 380, "[b]",                       {size: 28, color: :BLUE         })
    Nyle.draw_text(140, 380, "press key to change color", {size: 18})
  end

  def update
    @color = :RED          if Nyle.key_press?(KEY_r)
    @color = :FOREST_GREEN if Nyle.key_press?(KEY_g)
    @color = :BLUE         if Nyle.key_press?(KEY_b)

    Nyle.save_image("./sketch.png") if Nyle.key_press?(KEY_space)

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end

end

Screen.new.show_all
Gtk.main

