require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super(320, 320, {bgcolor: :ALICE_BLUE, trace: true})
    @draw    = true
    @rt_last = 0
  end

  def draw
    if @draw
      x = rand(Nyle.w)
      y = rand(Nyle.h)
      r = rand(3..50)
      c = rand(0..0xFFFFFF)
      a = rand(1..5)
      Nyle.draw_circle(x, y, r, {fill: true, color: "#%06x" % c, a: a / 10.0})
    end
  end

  def update
    @rt = Nyle.running_time
    if (@rt - @rt_last) >= 2000
      @rt_last = @rt
      @draw    = !@draw
      Nyle.clear if @draw
    end
  end
end


Screen.new.show_all({interval: nil})
Nyle.main

