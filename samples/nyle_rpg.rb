
require 'nyle'

class Character
  def initialize(x, y, tiles)
    @x     = x
    @y     = y
    @tiles = tiles
    @tx    = 0       # initial index of @tiles for x
    @ty    = 0       # initial index of @tiles for y
  end

  def draw
    Nyle.draw_image(@x, @y, @tiles[@tx][@ty])
  end

  def move(dx, dy)
    @ty = 0 if dy > 0    # index of @tiles for down
    @ty = 1 if dx < 0    # index of @tiles for left
    @ty = 2 if dx > 0    # index of @tiles for right
    @ty = 3 if dy < 0    # index of @tiles for up

    @tx += 1             # animation to walk
    @tx  = 0 if @tx > 2  # range = (0..2)

    @x += dx             # drawing position(x)
    @y += dy             # drawing position(y)

    @x = -@tiles[0][0].width   if @x >  Nyle.screen_width     # right end
    @x =  Nyle.screen_width    if @x < -@tiles[0][0].width    # left end
    @y = -@tiles[0][0].height  if @y >  Nyle.screen_height    # lower end
    @y =  Nyle.screen_height   if @y < -@tiles[0][0].height   # upper end
  end
end

class Screen < Nyle::Screen
  def initialize
    super(510, 390)
    @image            = Nyle.load_image("./image/n_i_bg.jpg", {sx: 0.5, sy: 0.5})
    @image_half_right = Nyle.load_image("./image/n_i_bg.jpg", {sx: 0.5, sy: 0.5, cx: 320, cy:   0, cw: 320, ch: 480})
    @image_half_low   = Nyle.load_image("./image/n_i_bg.jpg", {sx: 0.5, sy: 0.5, cx:   0, cy: 240, cw: 640, ch: 240})
    @image_quarter    = Nyle.load_image("./image/n_i_bg.jpg", {sx: 0.5, sy: 0.5, cx: 320, cy: 240, cw: 320, ch: 240})

    @tiles01      = Nyle.load_image_tiles("./image/n_i_chara.png", 1, 1)   # itself
    @tiles03      = Nyle.load_image_tiles("./image/n_i_chara.png", 3, 1)   # divide into  3 pieces horizontally
    @tiles04      = Nyle.load_image_tiles("./image/n_i_chara.png", 1, 4)   # divide into  4 pieces vertically
    @tiles12      = Nyle.load_image_tiles("./image/n_i_chara.png", 3, 4)   # divide into 12 pieces vertically and horizontally

    @tiles_player = Nyle.load_image_tiles("./image/n_i_chara.png", 3, 4, {sx: 1.25, sy: 1.25})   # divide into 12 pieces and enlarge
    @character = Character.new(140, 150, @tiles_player)
  end

  def draw
    Nyle.draw_image( 10,  10, @image)
    Nyle.draw_image(340,  10, @image_half_right)
    Nyle.draw_image( 10, 260, @image_half_low)
    Nyle.draw_image(340, 260, @image_quarter)

    for i in (0...1)
      for j in (0...1)
        Nyle.draw_image( 10 + i * 50,  10, @tiles01[i][j])
      end
    end

    for i in (0...3)
      for j in (0...1)
        Nyle.draw_image(200 + i * 50,  10, @tiles03[i][j])
      end
    end

    for i in (0...1)
      for j in (0...4)
        Nyle.draw_image( 10, 200 + j * 50, @tiles04[i][j])
      end
    end

    for i in (0...3)
      for j in (0...4)
        Nyle.draw_image(200 + i * 50, 200 + j * 50, @tiles12[i][j])
      end
    end

    @character.draw

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end

  def update
    dx = (Nyle.key_down?(KEY_Right) ? 1 : (Nyle.key_down?(KEY_Left) ? -1 : 0))
    dy = (Nyle.key_down?(KEY_Down)  ? 1 : (Nyle.key_down?(KEY_Up)   ? -1 : 0))
    @character.move(dx, dy)
  end
end


Screen.new.show_all
Gtk.main

