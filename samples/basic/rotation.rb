require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super(320, 320, {bgcolor: :BLACK, trace: true})
    @th      = 0
    @c1      = :RED
    @c2      = :ORANGE
    @c3      = :SCHOOL_BUS_YELLOW
    @x       = Nyle.w / 2
    @y       = Nyle.h / 2
    @rt_last = 0
  end

  def draw
    Nyle.draw_circle(@x + Math::cos(@th) *  30, @y + Math::sin(@th) *  30, 30, {weight: 10, color: @c1})
    Nyle.draw_circle(@x + Math::cos(@th) *  75, @y + Math::sin(@th) *  75, 30, {weight: 10, color: @c2})
    Nyle.draw_circle(@x + Math::cos(@th) * 120, @y + Math::sin(@th) * 120, 30, {weight: 10, color: @c3})
    Nyle.draw_rect(0, 0, Nyle.w, Nyle.h, {color: :BLACK, fill: true, a: 0.05})
  end

  def update
    @rt = Nyle.running_time
    if (@rt - @rt_last) >= 3000
      @rt_last = @rt
      @c1, @c2, @c3 = @c2, @c3, @c1
    end
    @th += Math::PI / 128
  end
end


Screen.new.show_all({interval: nil})
Nyle.main

