require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super(270, 240)
  end
  def draw
    Nyle.draw_rect( 10,  10, 50, 50, {fill: true, color: :RED       })
    Nyle.draw_rect( 60,  60, 50, 50, {fill: true, color: :GREEN     })
    Nyle.draw_rect(110, 110, 50, 50, {fill: true, color: :BLUE      })
    Nyle.draw_rect( 10, 110, 50, 50, {fill: true, color: :GOLD      })
    Nyle.draw_rect(110,  10, 50, 50, {fill: true, color: :BLACK     })
    Nyle.draw_rect(160,  60, 50, 50, {fill: true, color: :CHOCOLATE })
    Nyle.draw_rect(210, 110, 50, 50, {fill: true, color: :ORANGE    })
    Nyle.draw_rect(210,  10, 50, 50, {fill: true, color: :SILVER    })

    x, y = Nyle.mouse_x, Nyle.mouse_y
    if Nyle.pixel?(x, y, :WHITE)
      Nyle.draw_text(10, 220, 'Move mouse pointer over any tile', {size: 14})
    else
      color = Nyle.pixel(x, y)
      info = "(x=%3d, y=%3d)  %s" % [x, y, color]
      Nyle.draw_text(10, 220, info, {size: 18, color: color})
    end

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end
end


Screen.new.show_all
Nyle.main

