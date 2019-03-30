require 'gtk3'

module Samples
  class Launcher < Gtk::Window
    def initialize
      super
      set_title('Nyle samples')

      tree = create_tree
      tree_window = Gtk::ScrolledWindow.new
      tree_window.add(tree)

      @text = create_text
      text_window = Gtk::ScrolledWindow.new
      text_window.set_shadow_type(:in)
      text_window.add(@text)

      hpaned = Gtk::Paned.new(:horizontal)
      hpaned.add(tree_window, resize: false, shrink: false)
      hpaned.add(text_window, resize: true,  shrink: false)
      hpaned.position = 240

      self.add(hpaned)
      self.set_size_request(640, 640)
      self.signal_connect(:destroy) { Gtk.main_quit }
    end

    def create_tree
      model = Gtk::TreeStore.new(String, String, String, Integer)
      append_items(model, generate_source)

      column = Gtk::TreeViewColumn.new
      column.title = "Double click to run one at a time."

      render_text = Gtk::CellRendererText.new
      column.pack_start(render_text, true)
      column.add_attribute(render_text,   'text',       0)
      column.add_attribute(render_text,   'foreground', 2)
      column.add_attribute(render_text,   'weight',     3)

      tree_view = Gtk::TreeView.new
      tree_view.set_model(model)
      tree_view.append_column(column)
      tree_view.expand_all

      tree_view.signal_connect(:row_activated) do |tree_view, path, column|
        row_activated_callback(tree_view.model, path)
      end

      tree_view.selection.signal_connect(:changed) do |selection|
        iter = selection.selected
        load_file(iter.get_value(1)) if iter
      end
      tree_view
    end

    def create_text
      text_view = Gtk::TextView.new
      font_description = Pango::FontDescription.new('Monospace')
      font_description.size = (/darwin|mac os/ === RUBY_PLATFORM ? 13.3 : 10) * Pango::SCALE
      text_view.override_font(font_description)
      text_view.set_wrap_mode(:none)
      text_view.set_editable(false)
      text_view.set_cursor_visible(false)
      text_view.left_margin = 8
      text_view
    end

    def generate_source
      scripts = Dir.glob(File.join(File.dirname(__FILE__), '**/*.rb')).sort
      index = []
      scripts.each do |fn|
        index += [[File.basename(fn), fn, File.dirname(fn)]] unless File.basename(fn) == File.basename(__FILE__)
      end
      index
    end

    def append_items(model, source)   # only 2 layers (dir/filename)
      dir_iter = {}
      source.each do |title, filename, dir|
        if dir and !dir_iter.key?(dir)
          iter = model.append(nil)
          iter.set_value(0, " #{File.basename(dir)}")
          dir_iter[dir] = iter
        end
        iter = model.append(dir_iter[dir])
        iter.set_value(0, title)
        iter.set_value(1, filename)      # full-path to load
        iter.set_value(2, "darkgreen")   # color
        iter.set_value(3, 600)           # bold
      end
    end

    def row_activated_callback(model, path)
      unless @running
        begin
          @running = true
          lib = model.get_iter(path).get_value(1)
          if lib
            Dir.chdir(File.dirname(lib)) do
              load(File.basename(lib), priv: true)
            end
          end
        rescue Exception => e
          puts $!
        ensure
          @running = false
        end
      end
    end

    def load_file(filename)1
      unless @running
      @text.buffer.delete(*@text.buffer.bounds)
      if filename
        lines = File.read(filename)
        start = @text.buffer.get_iter_at(offset: 0)
        @text.buffer.insert(start, lines)
      end
      end
    end
  end
end


Samples::Launcher.new.show_all
Gtk.main

