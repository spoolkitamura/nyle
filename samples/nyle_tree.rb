
require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super(300, 200)
     setup
  end

  def setup
    @theta = nil                                  # rotation angle
  end

  def draw
    @theta = _map(Nyle.mouse_x, 0, @width, 0, Math::PI/2)
    Nyle.translate(@width / 2, @height);
    _branch(60)

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end

  private def _map(v, s1, e1, s2, e2)
    v = v.to_f if v.integer?                      # Convert integer into float
    (v - s1) / (e1 - s1) * (e2 - s2) + s2         # Adjust v in between s1 and e1 to between s2 and e2
  end

  private def _branch(len)
    sw = _map(len, 2, 120, 1, 10)                 # adjust weight as length of branch
    Nyle.draw_line(0, 0, 0, -len, {weight: sw})   # draw branch
    Nyle.translate(0, -len)                       # move origin
    len *= 0.66                                   # adjust length (two-thirds)
    if len > 2
      Nyle.cr.save do
        Nyle.rotate(@theta)                       # rotate
        _branch(len)
      end
      Nyle.cr.save do
        Nyle.rotate(-@theta)                      # rotate
        _branch(len)
      end
    end
  end
end


Screen.new.show_all
Gtk.main

