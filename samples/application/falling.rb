require 'nyle'

class Field
  SKYLINE = 400

  def initialize
    _init_score
  end

  private def _init_score
    @score       = 0
    @click_count = 0
  end

  def draw
    Nyle.draw_rect( 0, 0,       640, SKYLINE, {color: :SKY_BLUE,     fill: true})
    Nyle.draw_rect( 0, SKYLINE, 640, 480,     {color: :FOREST_GREEN, fill: true})
    Nyle.draw_text(80, 400 + 24, "Your score #{@score} points   Click count #{@click_count} times", {color: :WHITE, size: 24})
  end

  def add_score(score, click_count)
    @score       += score
    @click_count += click_count
  end

  def game_clear?
    @score >= 100
  end

  def init_score
    _init_score
  end
end


class Item
  MOVING_RANGE_X = 640
  MOVING_RANGE_Y = 480

  attr_reader :x, :y

  def initialize(filename, xrange, sx = 1.0, sy = 1.0)
    @image = Nyle.load_image(filename, {sx: sx, sy: sy, color_key: :WHITE})
    @xrange = xrange
    @sx = sx
    @sy = sy
    reset
  end

  def reset
    @x = rand(MOVING_RANGE_X)
    @y = 0
    @speed_x = (@xrange == 0 ? 0 : rand(@xrange) - (@xrange - 1) / 2)
    @speed_y = rand(10) + 3
  end

  def drop
    @x = @x + @speed_x
    @y = @y + @speed_y
    if @y > MOVING_RANGE_Y
      reset
    end
  end

  def centerx
    return @x + @image.width / 2
  end

  def centery
    return @y + @image.height / 2
  end

  def draw
    Nyle.draw_image(@x, @y, @image)
  end

  def clicked?
    clicked = false
    if Nyle.mouse_press?(MOUSE_L)
      diffx = Nyle.mouse_x - self.centerx
      diffy = Nyle.mouse_y - self.centery
      if (diffx > -20) and (diffx < 20) and (diffy > -20) and (diffy < 20)
        clicked = true
      end
    end
    return clicked
  end

end

class Weapon < Item
  def initialize
    super("../image/n_f_weapon.png", 7, 0.4, 0.4)
  end
end

class Banana < Item
  def initialize
    super("../image/n_f_banana.png", 0, 0.6, 0.6)
  end

  def get_score
    return 10
  end
end

class Strawberry < Item
  def initialize
    super("../image/n_f_strawberry.png", 0, 0.6, 0.6)
  end

  def get_score
    return 20
  end
end


class Hero
  MOVING_RANGE_X = 640

  def initialize(x, y)
    @image = Nyle.load_image("../image/n_f_panda.png", {sx: 0.3, sy: 0.3, color_key: :WHITE})
    @x = x - @image.width / 2
    @y = y - @image.height
    @speed = 3.5
  end

  def move(dx, dy)
    @x += (dx * @speed)
    @x = 0 if @x <= 0
    @x = MOVING_RANGE_X - @image.width if @x >= MOVING_RANGE_X - @image.width
  end

  def draw
    Nyle.draw_image(@x, @y, @image) 
  end

  def hit?(item)
    diffx = _centerx - item.centerx
    diffy = _centery - item.centery
    if (diffx > -20) and (diffx < 20) and (diffy > -20) and (diffy < 20)
      return true
    else
      return false
    end
  end

  private def _centerx
    return @x + @image.width / 2
  end

  private def _centery
    return @y + @image.height / 2
  end
end



class Screen_GameOver < Nyle::Screen
  def initialize
    super(640, 480, {bgcolor: :BEIGE})
  end
  def draw
    Nyle.draw_text( 60, 200, "Game over!  Thank you for playing.", {})

    Nyle.draw_text(450, 420, "[SPC] to Retry", {size: 20})
    Nyle.draw_text(450, 450, "[ESC] to Finish", {size: 20})

    @status = :REPLAY if Nyle.key_press?(KEY_space)
    Nyle.quit         if Nyle.key_press?(KEY_Escape)
  end

  def suspend
  end

  def resume
    # Initialize status
    @status = nil
  end
end

class Screen_GameClear < Nyle::Screen
  def initialize
    super(640, 480)
  end
  def draw
    Nyle.draw_text( 80, 200, "Congratulations!  You've won!", {color: :RED})
    Nyle.draw_text(450, 450, "[ESC] to Finish", {size: 20})

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end
end


class Screen_Play < Nyle::Screen
  NWEAPON     = 3
  NBANANA     = 2
  NSTRAWBERRY = 1

  def initialize
    super(640, 480)
    setup
  end

  def setup
    @field = Field.new
    @hero = Hero.new(@width / 2, Field::SKYLINE)
    @weapons      = []
    @bananas      = []
    @strawberries = []
    NWEAPON.times     { @weapons      << Weapon.new     }
    NBANANA.times     { @bananas      << Banana.new     }
    NSTRAWBERRY.times { @strawberries << Strawberry.new }
  end

  def draw
    @field.draw
    @hero.draw
    @weapons.each      { |weapon|      weapon.draw      }
    @bananas.each      { |banana|      banana.draw      }
    @strawberries.each { |strawberrie| strawberrie.draw }
  end

  def update
    @weapons.each      { |weapon|      weapon.drop      }
    @bananas.each      { |banana|      banana.drop      }
    @strawberries.each { |strawberrie| strawberrie.drop }
    _detect
    @hero.move(Nyle.cursor_x, 0)
    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end

  private def _detect
    (@weapons + @bananas + @strawberries).each do |item|
      # detect collision about hero and item
      if @hero.hit?(item)
        if item.instance_of?(Weapon)        # weapon
          @status = :GAMEOVER
        else                                # fruit
          @field.add_score(item.get_score, 0)
          @status = :GAMECLEAR if @field.game_clear?
          item.reset
        end
      end
      # detect click on item
      if item.clicked?
        if item.instance_of?(Weapon)        # weapon
          @status = :GAMEOVER
        else                                # fruit
          @field.add_score(item.get_score, 1)
          @status = :GAMECLEAR if @field.game_clear?
          item.reset
         end
      end
    end
  end

  def suspend
  end

  def resume
    # Initialize status
    @status = nil

    # Initialize positon of items
    @weapons.each      { |weapon|      weapon.reset      }
    @bananas.each      { |banana|      banana.reset      }
    @strawberries.each { |strawberrie| strawberrie.reset }

    # Initialize score
    @field.init_score
  end

end


class Frame < Nyle::Frame
  def initialize
    super(640, 480)

    @screen_play      = Screen_Play.new
    @screen_gameover  = Screen_GameOver.new
    @screen_gameclear = Screen_GameClear.new
    self.set_current(@screen_play)

    # Transition table
    @transition << {current: @screen_play,     status: :GAMEOVER,  next: @screen_gameover}
    @transition << {current: @screen_play,     status: :GAMECLEAR, next: @screen_gameclear}
    @transition << {current: @screen_gameover, status: :REPLAY,    next: @screen_play}
  end
end


Frame.new.show_all
Nyle.main

