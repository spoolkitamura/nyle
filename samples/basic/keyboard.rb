require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super(200, 200, {bgcolor: :IVORY})
  end

  def draw
    stat = ""
    stat = "[ctrl]"      if Nyle.mask_control?
    stat = "[shift]"     if Nyle.mask_shift?
    stat = "[space]"     if Nyle.key_down?(KEY_space)
    stat = "[backspace]" if Nyle.key_down?(KEY_BackSpace)
    stat = "[tab]"       if Nyle.key_down?(KEY_Tab)
    stat = "[enter]"     if Nyle.key_down?(KEY_Return)
    stat = "[escape]"    if Nyle.key_down?(KEY_Escape)
    stat = "[left]"      if Nyle.key_down?(KEY_Left)
    stat = "[up]"        if Nyle.key_down?(KEY_Up)
    stat = "[down]"      if Nyle.key_down?(KEY_Down)
    stat = "[right]"     if Nyle.key_down?(KEY_Right)
    stat = "[insert]"    if Nyle.key_down?(KEY_Insert)
    stat = "[delete]"    if Nyle.key_down?(KEY_Delete)
    stat = "[home]"      if Nyle.key_down?(KEY_Home)
    stat = "[end]"       if Nyle.key_down?(KEY_End)
    stat = "[f1]"        if Nyle.key_down?(KEY_F1)
    stat = "[f2]"        if Nyle.key_down?(KEY_F2)
    stat = "[f3]"        if Nyle.key_down?(KEY_F3)
    stat = "[f4]"        if Nyle.key_down?(KEY_F4)
    stat = "[f5]"        if Nyle.key_down?(KEY_F5)
    stat = "[f6]"        if Nyle.key_down?(KEY_F6)
    stat = "[f7]"        if Nyle.key_down?(KEY_F7)
    stat = "[f8]"        if Nyle.key_down?(KEY_F8)
    stat = "[f9]"        if Nyle.key_down?(KEY_F9)
    stat = "[f10]"       if Nyle.key_down?(KEY_F10)
    stat = "[f11]"       if Nyle.key_down?(KEY_F11)
    stat = "[f12]"       if Nyle.key_down?(KEY_F12)
    stat = "[0]"         if Nyle.key_down?(KEY_0)
    stat = "[1]"         if Nyle.key_down?(KEY_1)
    stat = "[2]"         if Nyle.key_down?(KEY_2)
    stat = "[3]"         if Nyle.key_down?(KEY_3)
    stat = "[4]"         if Nyle.key_down?(KEY_4)
    stat = "[5]"         if Nyle.key_down?(KEY_5)
    stat = "[6]"         if Nyle.key_down?(KEY_6)
    stat = "[7]"         if Nyle.key_down?(KEY_7)
    stat = "[8]"         if Nyle.key_down?(KEY_8)
    stat = "[9]"         if Nyle.key_down?(KEY_9)
    stat = "[a/A]"       if Nyle.key_down?(KEY_A) or Nyle.key_down?(KEY_a)
    stat = "[b/B]"       if Nyle.key_down?(KEY_B) or Nyle.key_down?(KEY_b)
    stat = "[c/C]"       if Nyle.key_down?(KEY_C) or Nyle.key_down?(KEY_c)
    stat = "[d/D]"       if Nyle.key_down?(KEY_D) or Nyle.key_down?(KEY_d)
    stat = "[e/E]"       if Nyle.key_down?(KEY_E) or Nyle.key_down?(KEY_e)
    stat = "[f/F]"       if Nyle.key_down?(KEY_F) or Nyle.key_down?(KEY_f)
    stat = "[g/G]"       if Nyle.key_down?(KEY_G) or Nyle.key_down?(KEY_g)
    stat = "[h/H]"       if Nyle.key_down?(KEY_H) or Nyle.key_down?(KEY_h)
    stat = "[i/I]"       if Nyle.key_down?(KEY_I) or Nyle.key_down?(KEY_i)
    stat = "[j/J]"       if Nyle.key_down?(KEY_J) or Nyle.key_down?(KEY_j)
    stat = "[k/K]"       if Nyle.key_down?(KEY_K) or Nyle.key_down?(KEY_k)
    stat = "[l/L]"       if Nyle.key_down?(KEY_L) or Nyle.key_down?(KEY_l)
    stat = "[m/M]"       if Nyle.key_down?(KEY_M) or Nyle.key_down?(KEY_m)
    stat = "[n/N]"       if Nyle.key_down?(KEY_N) or Nyle.key_down?(KEY_n)
    stat = "[o/O]"       if Nyle.key_down?(KEY_O) or Nyle.key_down?(KEY_o)
    stat = "[p/P]"       if Nyle.key_down?(KEY_P) or Nyle.key_down?(KEY_p)
    stat = "[q/Q]"       if Nyle.key_down?(KEY_Q) or Nyle.key_down?(KEY_q)
    stat = "[r/R]"       if Nyle.key_down?(KEY_R) or Nyle.key_down?(KEY_r)
    stat = "[s/S]"       if Nyle.key_down?(KEY_S) or Nyle.key_down?(KEY_s)
    stat = "[t/T]"       if Nyle.key_down?(KEY_T) or Nyle.key_down?(KEY_t)
    stat = "[u/U]"       if Nyle.key_down?(KEY_U) or Nyle.key_down?(KEY_u)
    stat = "[v/V]"       if Nyle.key_down?(KEY_V) or Nyle.key_down?(KEY_v)
    stat = "[w/W]"       if Nyle.key_down?(KEY_W) or Nyle.key_down?(KEY_w)
    stat = "[x/X]"       if Nyle.key_down?(KEY_X) or Nyle.key_down?(KEY_x)
    stat = "[y/Y]"       if Nyle.key_down?(KEY_Y) or Nyle.key_down?(KEY_y)
    stat = "[z/Z]"       if Nyle.key_down?(KEY_Z) or Nyle.key_down?(KEY_z)

    Nyle.draw_text(10,  60, "Press any key!" , {size: 24})
    Nyle.draw_text(30, 100, stat, {size: 24, color: :FOREST_GREEN})

   #Nyle.quit if Nyle.key_press?(KEY_Escape)
  end
end


Screen.new.show_all
Gtk.main

