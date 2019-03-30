require 'nyle'

class Controller < Gtk::Box
  def initialize(target)
    super(:vertical, 0)

    @target = target

    @l1_init = @target.L1
    @m1_init = @target.M1
    @l2_init = @target.L2
    @m2_init = @target.M2
    @g_init  = @target.G

    # length of upper pendulum
    scale_l1 = Gtk::Scale.new(:vertical, 50.0, 150.0, 0.1)
    scale_l1.set_size_request(65, 150)
    scale_l1.value = @l1_init
    scale_l1.draw_value = false
    label_caption_l1 = Gtk::Label.new("L1")
    label_value_l1   = Gtk::Label.new(scale_l1.value.round(1).to_s)
    label_value_l1.override_font(Pango::FontDescription.new('bold'))
    scale_l1.signal_connect(:value_changed) do |widget|
      widget.value = widget.value.round(1)
      label_value_l1.text = widget.value.to_s
      @target.L1 = widget.value if @target
      @target.status if @target
    end

    # mass of upper pendulum
    scale_m1 = Gtk::Scale.new(:vertical, 10.0, 20.0, 0.5)
    scale_m1.set_size_request(65, 150)
    scale_m1.value = @m1_init
    scale_m1.draw_value = false
    label_caption_m1 = Gtk::Label.new("M1")
    label_value_m1   = Gtk::Label.new(scale_m1.value.round(1).to_s)
    label_value_m1.override_font(Pango::FontDescription.new('bold'))
    label_value_m1.justify = :right
    scale_m1.signal_connect(:value_changed) do |widget|
      widget.value = widget.value.round(1)
      label_value_m1.text = widget.value.to_s
      @target.M1 = widget.value if @target
      @target.status if @target
    end

    # panel for upper pendulum
    box_l1 = Gtk::Box.new(:vertical, 0)
    box_l1.add(label_caption_l1)
    box_l1.add(Gtk::Separator.new(:horizontal))
    box_l1.add(label_value_l1)
    box_l1.add(scale_l1)

    box_m1 = Gtk::Box.new(:vertical, 0)
    box_m1.add(label_caption_m1)
    box_m1.add(Gtk::Separator.new(:horizontal))
    box_m1.add(label_value_m1)
    box_m1.add(scale_m1)

    box_1 = Gtk::Box.new(:horizontal, 0)
    box_1.add(box_l1)
    box_1.add(box_m1)

    frame_1 = Gtk::Frame.new
    frame_1.add(box_1)

    # length of lower pendulum
    scale_l2 = Gtk::Scale.new(:vertical, 50.0, 150.0, 0.1)
    scale_l2.set_size_request(65, 150)
    scale_l2.value = @l2_init
    scale_l2.draw_value = false
    label_caption_l2 = Gtk::Label.new("L2")
    label_value_l2   = Gtk::Label.new(scale_l2.value.round(1).to_s)
    label_value_l2.override_font(Pango::FontDescription.new('bold'))
    scale_l2.signal_connect(:value_changed) do |widget|
      widget.value = widget.value.round(1)
      label_value_l2.text = widget.value.to_s
      @target.L2 = widget.value if @target
      @target.status if @target
    end

    # mass of lower pendulum
    scale_m2 = Gtk::Scale.new(:vertical, 10.0, 20.0, 0.5)
    scale_m2.set_size_request(65, 150)
    scale_m2.value = @m2_init
    scale_m2.draw_value = false
    label_caption_m2 = Gtk::Label.new("M2")
    label_value_m2   = Gtk::Label.new(scale_m2.value.round(1).to_s)
    label_value_m2.override_font(Pango::FontDescription.new('bold'))
    label_value_m2.justify = :right
    scale_m2.signal_connect(:value_changed) do |widget|
      widget.value = widget.value.round(1)
      label_value_m2.text = widget.value.to_s
      @target.M2 = widget.value if @target
      @target.status if @target
    end

    # panel for lower pendulum
    box_l2 = Gtk::Box.new(:vertical, 0)
    box_l2.add(label_caption_l2)
    box_l2.add(Gtk::Separator.new(:horizontal))
    box_l2.add(label_value_l2)
    box_l2.add(scale_l2)

    box_m2 = Gtk::Box.new(:vertical, 0)
    box_m2.add(label_caption_m2)
    box_m2.add(Gtk::Separator.new(:horizontal))
    box_m2.add(label_value_m2)
    box_m2.add(scale_m2)

    box_2 = Gtk::Box.new(:horizontal, 0)
    box_2.add(box_l2)
    box_2.add(box_m2)

    frame_2 = Gtk::Frame.new
    frame_2.add(box_2)

    # panel for gravity
    label_caption_g = Gtk::Label.new("  G")
    spinner_g = Gtk::SpinButton.new(0.1, 2.0, 0.1)
    spinner_g.value = @g_init
    spinner_g.wrap = false
    box_g = Gtk::Box.new(:horizontal, 10)
    box_g.add(label_caption_g)
    box_g.add(spinner_g)
    spinner_g.signal_connect(:value_changed) do |widget|
      widget.value = widget.value.round(1)
      @target.G = widget.value if @target
      @target.status if @target
    end

    # reset button
    button = Gtk::Button.new(label: "Reset")
    button.focus = true
    button.signal_connect(:clicked) {
      if @target
        scale_l1.value  = @target.L1 = @l1_init   # set/get initial value
        scale_m1.value  = @target.M1 = @m1_init   # set/get initial value
        scale_l2.value  = @target.L2 = @l2_init   # set/get initial value
        scale_m2.value  = @target.M2 = @m2_init   # set/get initial value
        spinner_g.value = @target.G  = @g_init    # set/get initial value
        @target.status
      end
    }

    # control panel
    self.add(frame_1)
    self.add(frame_2)
    self.add(Gtk::Separator.new(:horizontal))
    self.add(box_g)
    self.add(button)
  end

end


class Screen < Nyle::Screen
  attr_accessor :L1, :M1, :L2, :M2, :G

  def initialize
    super(600, 600, {bgcolor: :WHITE})
    @L1   = 100
    @L2   = 100
    @M1   =  15
    @M2   =  15
    @G    = 1.0
    @cx   = Nyle.w / 2
    @cy   = Nyle.h / 2
    @a1_v = 0
    @a2_v = 0
    @a1   = Math::PI / 2
    @a2   = Math::PI / 2
    @points = []
  end

  def update
    #calc a1_a
    num1 = -@G * (2 * @M1 + @M2) * Math.sin(@a1)
    num2 = -@M2 * @G * Math.sin(@a1 - 2 * @a2)
    num3 = -2 * Math.sin(@a1 - @a2) * @M2
    num4 = @a2_v * @a2_v * @L2 + @a1_v * @a1_v * @L1 * Math.cos(@a1 - @a2)
    den = @L1 * (2 * @M1 + @M2 - @M2 * Math.cos(2 * @a1 - 2 * @a2))
    a1_a = (num1 + num2 + num3 * num4) / den
 
    #calc a2_a
    num1 = 2 * Math.sin(@a1 - @a2)
    num2 = (@a1_v * @a1_v * @L1 * (@M1 + @M2))
    num3 = @G * (@M1 + @M2) * Math.cos(@a1)
    num4 = @a2_v * @a2_v * @L2 * @M2 * Math.cos(@a1 - @a2)
    den = @L2 * (2 * @M1 + @M2 - @M2 * Math.cos(2 * @a1 - 2.0 * @a2))
    a2_a = (num1 * (num2 + num3 + num4)) / den

    @a1_v += a1_a
    @a2_v += a2_a
    @a1   += @a1_v
    @a2   += @a2_v
  end

  def draw
    x1 = @L1 * Math.sin(@a1)
    y1 = @L1 * Math.cos(@a1)
    x2 = x1 + @L2 * Math.sin(@a2)
    y2 = y1 + @L2 * Math.cos(@a2)

    Nyle.save do
     Nyle.translate(@cx, @cy)
     Nyle.draw_shape(@points, {weight: 1, color: :BLUE})
    end
    @points << [x2, y2]
    @points.shift if @points.length > 2000

    Nyle.save do
      Nyle.translate(@cx, @cy)
      # draw No1_pendulum
      Nyle.draw_line(0, 0, x1, y1)
      Nyle.draw_circle(x1, y1, @M1, {color: :BLACK, fill: true})

      # draw No2_pendulum
      Nyle.draw_line(x1, y1, x2, y2)
      Nyle.draw_circle(x2, y2, @M2, {color: :BLACK, fill: true})
    end
  end
end


class Frame < Nyle::Frame
  def initialize
    super
    self.set_size_request(740, 600)
    screen     = Screen.new
    controller = Controller.new(screen)
    box        = Gtk::Box.new(:horizontal)
    box.add(controller)
    #box.add(screen)
    box.pack_start(screen, expand: true,  fill: true, padding: 0)
    self.set_current(box)
  end
end


Frame.new.show_all
Nyle.main

