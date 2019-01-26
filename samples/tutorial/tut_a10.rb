require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super
  end
end

Screen.new.show_all
Gtk.main
