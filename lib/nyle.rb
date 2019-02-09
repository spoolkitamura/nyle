
=begin
    'Nyle'
      minimal graphics framework using Ruby/GTK3 and rcairo

      Copyright (c) 2018 Koki Kitamura
      Released under the MIT license
      https://opensource.org/licenses/mit-license.php
=end

require 'gtk3'
require 'rbconfig'

require 'nyle/version'
require 'nyle/frame'
require 'nyle/screen'

Gdk::Keyval.constants.each do |c|
 #puts "#{c} #{Gdk::Keyval.const_get(c)}"
  eval("#{c} = #{Gdk::Keyval.const_get(c)}")   # key name definication to omit 'Gdk::Keyval::'
end

MOUSE_L = 1
MOUSE_M = 2
MOUSE_R = 3

module Nyle
  class Error < StandardError; end

  DEFAULT_WIDTH  = 640
  DEFAULT_HEIGHT = 480
  DEFAULT_TITLE  = 'Nyle'

  @__cr              = nil
  @__screen_width    = DEFAULT_WIDTH
  @__screen_height   = DEFAULT_HEIGHT
  @__mouse_x         = 0
  @__mouse_y         = 0
  @__mouse_down      = {}
  @__mouse_down_last = {}
  @__mouse_press     = {}
  @__mouse_release   = {}
  @__key_down        = {}
  @__key_down_last   = {}
  @__key_press       = {}
  @__key_release     = {}
  @__mask_control    = false
  @__mask_shift      = false
  @__cursor_x        = 0
  @__cursor_y        = 0

  @__os = (
    host_os = RbConfig::CONFIG['host_os']
    case host_os
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      :mac
    when /linux/
      :linux
    else
      :unknown
    end
  )
  @__frame = nil   # main frame

  # Singleton class
  class << self
    # private methods for classes in module 'Nyle'
    private def _set_frame(frame)
      @__frame = frame
    end

    private def _set_cr(cr)
      @__cr = cr
    end

    private def _set_screen_size(w, h)
      @__screen_width  = w
      @__screen_height = h
    end

    private def _set_mouse_pos(x, y)
      @__mouse_x = x
      @__mouse_y = y
    end

    private def _set_mouse_down(button, status)
      @__mouse_down[button] = status
    end

    private def _set_key_down(keyval, status)
      @__key_down[keyval] = status
    end

    private def _update_mouse_state
      @__mouse_down.each_key do |k|
        change  = @__mouse_down[k] ^ @__mouse_down_last[k]       # Get change of mouse press status (XOR)
        press   = change &  @__mouse_down[k]                     # Detect change to press from release
        release = change & !@__mouse_down[k]                     # Detect change to release from press
        @__mouse_press[k] = press                                # Set mouse_press status
        @__mouse_release[k] = release                            # Set mouse_release status
        @__mouse_down_last[k] = @__mouse_down[k]
      end
    end

    private def _update_key_state
      @__key_down.each_key do |k|
        change  = @__key_down[k] ^ @__key_down_last[k]           # Get change of key press status (XOR)
        press   = change &  @__key_down[k]                       # Detect change to press from release
        release = change & !@__key_down[k]                       # Detect change to release from press
        @__key_press[k] = press                                  # Set key_press status
        @__key_release[k] = release                              # Set key_release status
        @__key_down_last[k] = @__key_down[k]

        if @__key_down[Gdk::Keyval::KEY_Control_L] or
          @__key_down[Gdk::Keyval::KEY_Control_R]
          @__mask_control = true                                 # Set true to mask_control status
        else
          @__mask_control = false                                # Set false to mask_control status
        end

        if @__key_down[Gdk::Keyval::KEY_Shift_L] or
          @__key_down[Gdk::Keyval::KEY_Shift_R]
          @__mask_shift = true                                   # Set true to mask_shift status
        else
          @__mask_shift = false                                  # Set false to mask_shift status
        end

        if @__key_down[Gdk::Keyval::KEY_Right]
          @__cursor_x = +1                                       # Set +1 to cursor_x value
        elsif @__key_down[Gdk::Keyval::KEY_Left]
          @__cursor_x = -1                                       # Set -1 to cursor_x value
        else
          @__cursor_x =  0
        end

        if @__key_down[Gdk::Keyval::KEY_Down]
          @__cursor_y = +1                                       # Set +1 to cursor_y value
        elsif @__key_down[Gdk::Keyval::KEY_Up]
          @__cursor_y = -1                                       # Set -1 to cursor_y value
        else
          @__cursor_y =  0
        end

      end
    end
  end


  # module functions for user
  # (need module_eval{} statement to use including Nyle)
  module_function def cr                      ;  Nyle.module_eval{ @__cr                            } ; end
  module_function def screen_width            ;  Nyle.module_eval{ @__screen_width                  } ; end
  module_function def screen_height           ;  Nyle.module_eval{ @__screen_height                 } ; end
  module_function def mouse_x                 ;  Nyle.module_eval{ @__mouse_x                       } ; end
  module_function def mouse_y                 ;  Nyle.module_eval{ @__mouse_y                       } ; end
  module_function def mouse_down?(button)     ;  Nyle.module_eval{ @__mouse_down   [button] == true } ; end
  module_function def mouse_press?(button)    ;  Nyle.module_eval{ @__mouse_press  [button] == true } ; end
  module_function def mouse_release?(button)  ;  Nyle.module_eval{ @__mouse_release[button] == true } ; end
  module_function def key_down?(keyval)       ;  Nyle.module_eval{ @__key_down     [keyval] == true } ; end
  module_function def key_press?(keyval)      ;  Nyle.module_eval{ @__key_press    [keyval] == true } ; end
  module_function def key_release?(keyval)    ;  Nyle.module_eval{ @__key_release  [keyval] == true } ; end
  module_function def mask_control?           ;  Nyle.module_eval{ @__mask_control                  } ; end
  module_function def mask_shift?             ;  Nyle.module_eval{ @__mask_shift                    } ; end
  module_function def cursor_x                ;  Nyle.module_eval{ @__cursor_x                      } ; end
  module_function def cursor_y                ;  Nyle.module_eval{ @__cursor_y                      } ; end
  module_function def os                      ;  Nyle.module_eval{ @__os                            } ; end

  module_function def save
    cr = Nyle.module_eval{ @__cr }
    cr.save do
      yield
    end
  end

  module_function def draw_line(x1, y1, x2, y2, weight: 2, cap: :BUTT, color: :BLACK, a: 1.0)
    cr = Nyle.module_eval{ @__cr }
    cr.save do
      cr.line_width = weight
      cr.line_cap   = cap
      cr.set_source_rgba(Cairo::Color.parse(color).r, 
                         Cairo::Color.parse(color).g, 
                         Cairo::Color.parse(color).b, a)
      cr.move_to(x1, y1)
      cr.line_to(x2, y2)
      cr.stroke
    end
  end

  module_function def draw_rect(x, y, w, h, weight: 2, cap: :BUTT, color: :BLACK, round: 0, fill: false, a: 1.0)
    cr = Nyle.module_eval{ @__cr }
    cr.save do
      cr.line_width = weight
      cr.line_cap   = cap
      cr.set_source_rgba(Cairo::Color.parse(color).r, 
                         Cairo::Color.parse(color).g, 
                         Cairo::Color.parse(color).b, a)
      if round
        cr.rounded_rectangle(x, y, w, h, round, round)
      else
        cr.rectangle(x, y, w, h)
      end
      if fill
        cr.fill
      else
        cr.stroke
      end
    end
  end

  module_function def draw_circle(x, y, r, weight: 2, color: :BLACK, fill: false, a: 1.0)
    cr = Nyle.module_eval{ @__cr }
    cr.save do
      cr.line_width = weight
      cr.set_source_rgba(Cairo::Color.parse(color).r, 
                         Cairo::Color.parse(color).g, 
                         Cairo::Color.parse(color).b, a)
      cr.circle(x, y, r)
      if fill
        cr.fill
      else
        cr.stroke
      end
    end
  end

  module_function def draw_shape(points, weight: 2, cap: :BUTT, color: :BLACK, a: 1.0, close: false, fill: false)
    cr = Nyle.module_eval{ @__cr }
    cr.save do
      cr.line_width = weight
      cr.line_cap   = cap
      cr.set_source_rgba(Cairo::Color.parse(color).r, 
                         Cairo::Color.parse(color).g, 
                         Cairo::Color.parse(color).b, a)
      vertex = points.dup
      vertex << vertex.first if close   # closed shape
      vertex.each do |v|
        cr.line_to(v[0], v[1])
      end
      if fill
        cr.fill
      else
        cr.stroke
      end
    end
  end

  module_function def draw_text(x, y, str, size: 32, color: :BLACK, a: 1.0, font: "sans-serif", italic: false, bold: false)
    cr = Nyle.module_eval{ @__cr }
    cr.save do
      pango_layout = cr.create_pango_layout
      pango_layout.text = str
      font_description        = Pango::FontDescription.new
      font_description.family = font
      font_description.style  = :italic if italic
      font_description.weight = 700 if bold
      font_description.size   = size * (72.0 / 96.0) * Pango::SCALE
      pango_layout.font_description = font_description
      cr.update_pango_layout(pango_layout)
      cr.set_source_rgba(Cairo::Color.parse(color).r,
                         Cairo::Color.parse(color).g,
                         Cairo::Color.parse(color).b, a)
      delta = (Nyle.module_eval{ @__os } == :mac ? size * (72.0 / 96.0) : size)
      cr.move_to(x, y - delta)   # Why :mac?
      cr.show_pango_layout(pango_layout)
    end
  end

  module INNER
    # for Nyle.load_image* methods
    class << self
      private def _load_image(filename, color_key: nil)
        loaded = GdkPixbuf::Pixbuf.new(file: filename)
        if color_key
          # Set transparent color with given color (alpha = 0)
          loaded.add_alpha(true,
                           Cairo::Color.parse(color_key).r * 255,   # 0 - 255
                           Cairo::Color.parse(color_key).g * 255,   # 0 - 255
                           Cairo::Color.parse(color_key).b * 255)   # 0 - 255
        else
          # Not to transpare
          loaded
        end
      end
    end
  end

  module_function def load_image(filename, color_key: nil, sx: 1.0, sy: 1.0, cx: nil, cy: nil, cw: nil, ch: nil)
    loaded = Nyle::INNER.module_eval{ _load_image(filename, color_key: color_key) }
    if !(cx.nil? or cy.nil? or cw.nil? or ch.nil?)
      loaded = loaded.subpixbuf(cx, cy, cw, ch)
    end
    loaded = loaded.scale(loaded.width * sx, loaded.height * sy)
  end

  module_function def load_image_tiles(filename, xcount, ycount, color_key: nil, sx: 1.0, sy: 1.0)
    loaded = Nyle::INNER.module_eval{ _load_image(filename, color_key: color_key) }
    xcount = 1 if xcount < 1
    ycount = 1 if ycount < 1
    cw = loaded.width  / xcount
    ch = loaded.height / ycount
    tiles = []
    for i in (0...xcount) do
      line = []
      for j in (0...ycount) do
        line << loaded.subpixbuf(cw * i, ch * j, cw, ch).scale(cw * sx, ch * sy)
      end
      tiles << line
    end
    tiles
  end

  module_function def draw_image(x, y, pixbuf, pos: :CORNER)
    cr = Nyle.module_eval{ @__cr }
    cr.save do
      if pos == :CENTER
        cr.set_source_pixbuf(pixbuf, x - pixbuf.width / 2, y - pixbuf.height / 2)
      else
        cr.set_source_pixbuf(pixbuf, x, y)   # :CORNER
      end
      cr.paint
    end
  end

  module_function def save_image(filename)
    cr = Nyle.module_eval{ @__cr }
    cr.target.write_to_png(filename)
  end

  module INNER
    # for Nyle.pixel* methods
    class << self
      private def _pixel(x, y)
        cr = Nyle.module_eval{ @__cr }
        surface = cr.target
        address = surface.width * (y.to_i * 4) + (x.to_i * 4)
        color   = surface.data.byteslice(address, 4).unpack("H*").first.upcase   # e.g. '\xcc\x77\x00\xff -> ['cc7700ff'] -> 'CC7700FF'
        color   = '#'               +
                  color.slice(4, 2) +
                  color.slice(2, 2) +
                  color.slice(0, 2)     # #BBGGRR -> #RRGGBB
      end
    end
  end

  module_function def pixel(x, y)
    Nyle::INNER.module_eval{ _pixel(x, y) }
  end

  module_function def pixel?(x, y, color)
    c = Nyle::INNER.module_eval{ _pixel(x, y) }
    return (c == Cairo::Color.parse(color).to_s[0, 7] ? true : false)
  end

  module_function def translate(tx, ty)
    cr = Nyle.module_eval{ @__cr }
    cr.translate(tx, ty)
  end

  module_function def rotate(angle)
    cr = Nyle.module_eval{ @__cr }
    cr.rotate(angle)
  end

  module_function def scale(sx, sy)
    cr = Nyle.module_eval{ @__cr }
    cr.scale(sx, sy)
  end

  module_function def quit
    @__frame.close if @__frame   # destroy
#    Gtk.main_quit
  end

end



if $0 == __FILE__
  p Nyle
  p Nyle.instance_methods
  p Nyle.private_instance_methods
 #p Nyle.private_methods
  p Nyle.protected_methods
 #p Nyle.public_methods
  p Nyle.singleton_methods

  p Nyle::Frame
  p Nyle::Frame.instance_methods(false)
  p Nyle::Frame.private_instance_methods(false)
  p Nyle::Frame.singleton_methods(false)

  p Nyle::Screen
  p Nyle::Screen.instance_methods(false)
  p Nyle::Screen.private_instance_methods(false)
  p Nyle::Screen.singleton_methods(false)

  p Nyle.os
end


# [TODO] Font name (draw_text)

