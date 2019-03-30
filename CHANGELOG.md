### 0.7.1 (2019/03/30)
#### New features
* add `Nyle.clear` method
* add `Nyle.running_time` method
* add `Nyle.main` method
* add `Nyle.create_screen` method
* add `Nyle.create_frame` method
* add `Nyle::Screen#start` method
* set alias `w` to `screen_width`
* set alias `h` to `screen_height`
* enhance `Nyle::Screen#show_all` method to be able to specify the interval time

#### Bug fixes, etc.
* adjust `draw_shape` method about `cap` option

#### Samples
* add `pause.rb`
* add `random_walk_trace_fadeout.rb`
* add `rotation.rb`
* add `double_pendulum.rb`
* adjust `color_chart.rb`
* adjust `random_walk.rb`
* adjust `random_walk_trace.rb`
* use `Nyle.main` method


### 0.7.0 (2019/02/09)
#### New features
* enhance `draw_text` to be able to specify font attributes(font-name, italic, bold)
* change implementation of `draw_text` to use `show_pango_layout` instead of `show_text`

#### Bug fixes, etc.
* adjust `nyle.gemspec`

#### Samples
* revise `draw_text.rb`
* ...and adjust other samples a little


### 0.6.1 (2019/01/27)
#### New features
* add `Nyle.cursor_x` method
* add `Nyle.cursor_y` method
* enhance `Nyle.draw_image` to be able to specify option `pos`

#### Bug fixes, etc.
* adjust `Nyle.pixel` and `Nyle.pixel?` to apply 'to_i'
* change format of color code from #RRGGBBAA to #RRGGBB
* change maxinum value of @NYLE_INTERVAL` to '1000'
* change `Nyle.quit` to close `Nyle::Frame` instead of `Gtk.main_quit`

#### Reference manual
* change PDF to WEB(wiki)

#### Samples
* use `Nyle.cursor_x` and `Nyle.cursor_y`
* use option `pos` of `Nyle.draw_image`
* prepare `launcher.rb` to run samples
* ...and revise a lot


### 0.6.0 (2018/12/01)
#### New features
* add `Nyle.pixel` method
* add `Nyle.pixel?` method
* add `Nyle.save` method
* enhance `Nyle::Frame#set_current` to use container widget of GTK3

#### Bug fixes, etc.
* add defintion of key names
* define constant of mouse buttons
* move key/mouse state process to :draw signal handler in `Nyle::Screen`

#### Reference manual
* revise

#### Samples
* use `MOUSE_L` `MOUSE_R`
* add `nyle_click.rb`
* add `nyle_clock.rb`
* add `nyle_flight.rb`
* add `nyle_pixel.rb`
* add `nyle_sugar.rb`


### 0.5.2 (2018/11/11)
#### New features
* release as RubyGems
* add `Nyle.draw_shape` method
* add `Nyle::Screen#suspend` method and `Nyle::Screen#resume` method
* enhance `a`(alpha value) option in `Nyle.draw_*`
* append `?` letter to method which returns true ot false


### 0.4.0 (2018/11/04)
#### New features

* add `Nyle.load_image_tiles` method
* add `Nyle.screen_width` method
* add `Nyle.screen_height` method
* add `cw` and `ch` option in `Nyle.load_image` method

#### Bug fixes, etc.
* delete `set_default_size` (using gtk3-3.3.0)

#### Samples
* adjust calling `Nyle.load_image` method at `initialize`


### 0.3.0 (2018/11/02)
#### Bug fixes, etc.

* change `_set_cr(widget.window.create_cairo_context)` to `_set_cr(cairo_context)`  
  (`Class Nyle::Screen` `signal_connect(:draw)`)
* change `set_default_size` to `set_size_request` (except on Windows)  
  (`Class Nyle::frame` `initialize`)
* add `Nyle.os` (for internal)
* delete `NYLE_SCALE` environment variable


### 0.2.0 (2018/11/01)
* Bug fixes, etc.


### 0.1.0 (2018/10/28)
* release


### 0.0.1 (2018/09/16)
* trial release

