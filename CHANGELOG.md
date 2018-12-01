
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
* add `a`(alpha value) option in `Nyle.draw_*`
* add `Nyle::Scneen#suspend` method and `Nyle::Scneen#resume` method
* give `?` letter to method which returns true ot false


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

