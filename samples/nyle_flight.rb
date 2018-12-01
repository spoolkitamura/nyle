
require 'nyle'

class Tree
  def initialize(x, y, z)
    @x, @y, @z = x, y, z
    @image = Nyle.load_image('./image/n_fl_tree32.png')
  end

  def draw(altitude)
    dx =  ((@x - 320) / @z)
    dy = (((@y - 240) / @z - 60) * ((altitude - 100) / 300.0) - (altitude - 230))
    Nyle.cr.save do
      Nyle.translate(dx, dy)
      Nyle.scale(5 / @z, 5 / @z)
      Nyle.draw_image(0, 0, @image)
    end
  end

  def update
    @z -= 0.15
    @z < 0.5 ? true : false   # delete tree by 'delete_if' method when true
  end
end

class Ground
  def initialize
    @altitude = 200
    @angle    =   0
    @trees    =  []
  end

  def draw
    Nyle.cr.save do
      # draw ground
      Nyle.translate(320, 240)
      Nyle.rotate(@angle)
      Nyle.draw_rect(-500, 240 - @altitude, 1000, 600, {color: :FOREST_GREEN, fill: true})

      # draw trees
      @trees.unshift(Tree.new(rand(2000) - 1000, 500, 5.0))
      @trees.delete_if do |tree|
        tree.draw(@altitude)
        tree.update
      end
    end
    Nyle.draw_text(10, 30, "altitude: #{@altitude}   angle: #{"%2.1f" % (@angle * 180 / Math::PI) }", {color: :RED, size: 20})
  end

  def update(angle, altitude)
    @angle += (1.8 * angle / 180 * Math::PI)
    if @angle < (-60.0 / 180 * Math::PI) then
      @angle = (-60.0 / 180 * Math::PI)
    end
    if @angle > (60.0 / 180 * Math::PI) then
      @angle = (60.0 / 180 * Math::PI)
    end
    @altitude += (5 * altitude)
    @altitude = 400 if @altitude > 400
    @altitude = 100 if @altitude < 100
  end
end


class Screen < Nyle::Screen
  def initialize
    super(640, 480, {bgcolor: :LIGHT_CYAN})
    @ground = Ground.new
  end

  def draw
    @ground.draw
  end

  def update
    angle    = (Nyle.key_down?(KEY_Right) ? -1 : (Nyle.key_down?(KEY_Left) ? 1 : 0))
    altitude = (Nyle.key_down?(KEY_Down)  ? -1 : (Nyle.key_down?(KEY_Up)   ? 1 : 0))
    @ground.update(angle, altitude)

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end
end


Screen.new.show_all
Gtk.main

