
=begin
    'Nyle'
      minimal graphics framework using Ruby/GTK3 and rcairo

      Copyright (c) 2018 Koki Kitamura
      Released under the MIT license
      https://opensource.org/licenses/mit-license.php
=end

MOUSE_L    = 1
MOUSE_M    = 2
MOUSE_R    = 3

Gdk::Keyval.constants.each do |c|
  eval("#{c} = Gdk::Keyval::#{c}")
end

module Nyle
  module DefineTable
    def self.extended(obj)
      obj.module_eval{ _table }   # run when extened from class/module
    end

    private def _check_key(*args)
      _check(*args, :KEY)
    end

    private def _check_button(*args)
      _check(*args, :BUTTON)
    end

    private def _check(state, value, kind)
      if    Integer === value
        return state[value] == true
      elsif Symbol === value
        table = {}
        table = @__table_keys[value]    if kind == :KEY
        table = @__table_buttons[value] if kind == :BUTTON
        table.each do |target|
          return state[target] if state[target]
        end
        return false
      else
        return false
      end
    end

    private def _table
      @__table_buttons = {
        :LEFT   => [MOUSE_L],
        :L      => [MOUSE_L],
        :MIDDLE => [MOUSE_M],
        :M      => [MOUSE_M],
        :RIGHT  => [MOUSE_R],
        :R      => [MOUSE_R],
      }
      @__table_keys = {
        :SPACE     => [KEY_space],
        :BACKSPACE => [KEY_BackSpace],
        :TAB       => [KEY_Tab],
        :RETURN    => [KEY_Return],
        :ESCAPE    => [KEY_Escape],
        :LEFT      => [KEY_Left],
        :UP        => [KEY_Up],
        :RIGHT     => [KEY_Right],
        :DOWN      => [KEY_Down],
        :PAGEUP    => [KEY_Page_Up],
        :PAGE_UP   => [KEY_Page_Up],
        :PAGEDOWN  => [KEY_Page_Down],
        :PAGE_DOWN => [KEY_Page_Down],
        :INSERT    => [KEY_Insert],
        :DELETE    => [KEY_Delete],
        :HOME      => [KEY_Home],
        :END       => [KEY_End],
        :F1        => [KEY_F1],
        :F2        => [KEY_F2],
        :F3        => [KEY_F3],
        :F4        => [KEY_F4],
        :F5        => [KEY_F5],
        :F6        => [KEY_F6],
        :F7        => [KEY_F7],
        :F8        => [KEY_F8],
        :F9        => [KEY_F9],
        :F10       => [KEY_F10],
        :F11       => [KEY_F11],
        :F12       => [KEY_F12],
        :SHIFT     => [KEY_Shift_L, KEY_Shift_R],
        :SHIFT_L   => [KEY_Shift_L],
        :SHIFT_R   => [KEY_Shift_R],
        :CONTROL   => [KEY_Control_L, KEY_Control_R],
        :CONTROL_L => [KEY_Control_L],
        :CONTROL_R => [KEY_Control_R],
        :META      => [KEY_Meta_L, KEY_Meta_R],
        :META_L    => [KEY_Meta_L],
        :META_R    => [KEY_Meta_R],
        :ALT       => [KEY_Alt_L, KEY_Alt_R],
        :ALT_L     => [KEY_Alt_L],
        :ALT_R     => [KEY_Alt_R],
        :_0        => [KEY_0],
        :_1        => [KEY_1],
        :_2        => [KEY_2],
        :_3        => [KEY_3],
        :_4        => [KEY_4],
        :_5        => [KEY_5],
        :_6        => [KEY_6],
        :_7        => [KEY_7],
        :_8        => [KEY_8],
        :_9        => [KEY_9],
        :A         => [KEY_a, KEY_A],
        :B         => [KEY_b, KEY_B],
        :C         => [KEY_c, KEY_C],
        :D         => [KEY_d, KEY_D],
        :E         => [KEY_e, KEY_E],
        :F         => [KEY_f, KEY_F],
        :G         => [KEY_g, KEY_G],
        :H         => [KEY_h, KEY_H],
        :I         => [KEY_i, KEY_I],
        :J         => [KEY_j, KEY_J],
        :K         => [KEY_k, KEY_K],
        :L         => [KEY_l, KEY_L],
        :M         => [KEY_m, KEY_M],
        :N         => [KEY_n, KEY_N],
        :O         => [KEY_o, KEY_O],
        :P         => [KEY_p, KEY_P],
        :Q         => [KEY_q, KEY_Q],
        :R         => [KEY_r, KEY_R],
        :S         => [KEY_s, KEY_S],
        :T         => [KEY_t, KEY_T],
        :U         => [KEY_u, KEY_U],
        :V         => [KEY_v, KEY_V],
        :W         => [KEY_w, KEY_W],
        :X         => [KEY_x, KEY_X],
        :Y         => [KEY_y, KEY_Y],
        :Z         => [KEY_z, KEY_Z],
      }
    end
  end

end

