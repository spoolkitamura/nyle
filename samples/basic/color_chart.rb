require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super(480, 600)
    setup
  end

  def setup
    @colors      = _color_list
    @start_index = 0
    @bar_w       = 200
    @bar_h       =  30
  end

  def draw
    @colors.each_with_index do |c, i|
      next if i < @start_index
      y =  (i - @start_index) * @bar_h
      Nyle.draw_rect(0, y, @bar_w, @bar_h, {color: c, fill: true})
      Nyle.draw_text(@bar_w + 10, y + @bar_h - 10, "#{c.to_s}", {color: :BLACK, size: 16})
    end
  end

  def update
    if Nyle.key_press?(KEY_Up) or Nyle.mouse_press?(MOUSE_R)
      @start_index -= (@height / @bar_h)
      @start_index = (@colors.length / (@height / @bar_h)) * (@height / @bar_h) if @start_index < 0
    end

    if Nyle.key_press?(KEY_Down) or Nyle.mouse_press?(MOUSE_L)
      @start_index += (@height / @bar_h)
      @start_index = 0 if @start_index >= @colors.length
    end

    if Nyle.key_press?(KEY_space)
      @colors.each do |c|
        puts "#{Cairo::Color.parse(c).to_s} (#{c.to_s})"
      end
    end

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end

  def _color_list
    [
      :ALICE_BLUE,                       #   #F0F8FF
      :ALIZARIN_CRIMSON,                 #   #E32637
      :AMARANTH,                         #   #E62B50
      :AMBER,                            #   #FFBF00
      :AMETHYST,                         #   #9966CC
      :ANTIQUE_WHITE,                    #   #FAEBD8
      :APRICOT,                          #   #FBCEB2
      :AQUA,                             #   #00FFFF
      :AQUAMARINE,                       #   #80FFD5
      :ASPARAGUS,                        #   #7CA15B
      :AZURE,                            #   #0080FF
      :BEIGE,                            #   #F5F5DD
      :BISQUE,                           #   #FFE5C4
      :BISTRE,                           #   #3E2B1F
      :BLACK,                            #   #000000
      :BLANCHED_ALMOND,                  #   #FFEBCD
      :BLAZE_ORANGE,                     #   #FF6600
      :BLUE,                             #   #0000FF
      :BLUE_VIOLET,                      #   #8A2BE3
      :BONDI_BLUE,                       #   #0095B6
      :BRIGHT_GREEN,                     #   #66FF00
      :BRIGHT_TURQUOISE,                 #   #08E8DF
      :BROWN,                            #   #964C00
      :BUFF,                             #   #F0DD82
      :BURGUNDY,                         #   #800020
      :BURLY_WOOD,                       #   #DFB887
      :BURNT_ORANGE,                     #   #CC5500
      :BURNT_SIENNA,                     #   #E97551
      :BURNT_UMBER,                      #   #8A3324
      :CADET_BLUE,                       #   #5F9FA1
      :CAMOUFLAGE_GREEN,                 #   #79866C
      :CARDINAL,                         #   #C41E3B
      :CARMINE,                          #   #960018
      :CARNATION,                        #   #F95A61
      :CARROT_ORANGE,                    #   #ED9121
      :CELADON,                          #   #ADE2B0
      :CERISE,                           #   #DF3163
      :CERULEAN,                         #   #007CA8
      :CERULEAN_BLUE,                    #   #2A52BE
      :CHARTREUSE,                       #   #80FF00
      :CHARTREUSE_YELLOW,                #   #E0FF00
      :CHESTNUT,                         #   #CD5C5C
      :CHOCOLATE,                        #   #D36A1E
      :CINNAMON,                         #   #7C4000
      :COBALT,                           #   #0048AC
      :COPPER,                           #   #B87433
      :COPPER_ROSE,                      #   #996666
      :CORAL,                            #   #FF8050
      :CORAL_RED,                        #   #FF4141
      :CORN,                             #   #FBEC5D
      :CORNFLOWER_BLUE,                  #   #6495ED
      :CORNSILK,                         #   #FFF8DD
      :CREAM,                            #   #FFFDD1
      :CRIMSON,                          #   #DD143D
      :CYAN,                             #   #00FFFF
      :DARK_BLUE,                        #   #00008B
      :DARK_CYAN,                        #   #008B8B
      :DARK_GOLDENROD,                   #   #B8860C
      :DARK_GRAY,                        #   #AAAAAA
      :DARK_GREEN,                       #   #006400
      :DARK_KHAKI,                       #   #BDB76C
      :DARK_MAGENTA,                     #   #8B008B
      :DARK_OLIVE_GREEN,                 #   #556C2F
      :DARK_ORANGE,                      #   #FF8C00
      :DARK_ORCHID,                      #   #9932CC
      :DARK_POWDER_BLUE,                 #   #003399
      :DARK_RED,                         #   #8B0000
      :DARK_SALMON,                      #   #E9967B
      :DARK_SEA_GREEN,                   #   #8FBC8F
      :DARK_SLATE_BLUE,                  #   #493E8B
      :DARK_SLATE_GRAY,                  #   #2F4F4F
      :DARK_TURQUOISE,                   #   #00CED2
      :DARK_VIOLET,                      #   #9400D4
      :DEEP_PINK,                        #   #FF1493
      :DEEP_SKY_BLUE,                    #   #00BFFF
      :DENIM,                            #   #1660BD
      :DIM_GRAY,                         #   #6A6A6A
      :DODGER_BLUE,                      #   #1E90FF
      :EGGPLANT,                         #   #990066
      :EMERALD,                          #   #50C879
      :FALU_RED,                         #   #801818
      :FERN_GREEN,                       #   #4F7A43
      :FIRE_BRICK,                       #   #B22222
      :FLAX,                             #   #EEDD82
      :FLORAL_WHITE,                     #   #FFFAF0
      :FOREST_GREEN,                     #   #228B22
      :FRENCH_ROSE,                      #   #F64B8A
      :FUCHSIA,                          #   #FF00FF
      :GAINSBORO,                        #   #DDDDDD
      :GAMBOGE,                          #   #E59C0F
      :GHOST_WHITE,                      #   #F8F8FF
      :GOLD,                             #   #FFD800
      :GOLDENROD,                        #   #DBA620
      :GRAY,                             #   #808080
      :GRAY_ASPARAGUS,                   #   #475946
      :GREEN,                            #   #00FF00
      :GREEN_YELLOW,                     #   #AEFF2F
      :HARLEQUIN,                        #   #40FF00
      :HELIOTROPE,                       #   #E074FF
      :HOLLYWOOD_CERISE,                 #   #F400A2
      :HONEYDEW,                         #   #F0FFF0
      :HOT_MAGENTA,                      #   #FF00CC
      :HOT_PINK,                         #   #FF6AB5
      :INDIAN_RED,                       #   #CD5C5C
      :INDIGO,                           #   #4C0082
      :INTERNATIONAL_KLEIN_BLUE,         #   #002FA8
      :INTERNATIONAL_ORANGE,             #   #FF4F00
      :IVORY,                            #   #FFFFF0
      :JADE,                             #   #00A96C
      :KHAKI,                            #   #C3B191
      :KHAKI_X11,                        #   #F0E78C
      :LAVENDER,                         #   #B57FDD
      :LAVENDER_BLUE,                    #   #CCCCFF
      :LAVENDER_BLUSH,                   #   #FFF0F5
      :LAVENDER_GRAY,                    #   #BDBBD8
      :LAVENDER_PINK,                    #   #FBAFD3
      :LAVENDER_ROSE,                    #   #FBA1E3
      :LAWN_GREEN,                       #   #7DFC00
      :LEMON,                            #   #FDE911
      :LEMON_CHIFFON,                    #   #FFFACD
      :LIGHT_BLUE,                       #   #AED9E7
      :LIGHT_CORAL,                      #   #F08080
      :LIGHT_CYAN,                       #   #E1FFFF
      :LIGHT_GOLDENROD_YELLOW,           #   #FAFAD3
      :LIGHT_GREEN,                      #   #90EE90
      :LIGHT_GREY,                       #   #D4D4D4
      :LIGHT_PINK,                       #   #FFB6C1
      :LIGHT_SALMON,                     #   #FFA17B
      :LIGHT_SEA_GREEN,                  #   #20B2AB
      :LIGHT_SKY_BLUE,                   #   #87CEFA
      :LIGHT_SLATE_GRAY,                 #   #788899
      :LIGHT_STEEL_BLUE,                 #   #B1C4DF
      :LIGHT_YELLOW,                     #   #FFFFE1
      :LILAC,                            #   #C8A3C8
      :LIME,                             #   #BFFF00
      :LIME_GREEN,                       #   #32CD32
      :LINEN,                            #   #FAF0E7
      :MAGENTA,                          #   #FF00FF
      :MALACHITE,                        #   #0CDB51
      :MAROON,                           #   #800000
      :MAUVE,                            #   #E1B1FF
      :MEDIUM_AQUAMARINE,                #   #66CDAB
      :MEDIUM_BLUE,                      #   #0000CD
      :MEDIUM_CARMINE,                   #   #B04136
      :MEDIUM_LAVENDER,                  #   #EE82EE
      :MEDIUM_ORCHID,                    #   #BA55D4
      :MEDIUM_PURPLE,                    #   #9371DC
      :MEDIUM_SEA_GREEN,                 #   #3DB372
      :MEDIUM_SLATE_BLUE,                #   #7C69EE
      :MEDIUM_SPRING_GREEN,              #   #00FA9B
      :MEDIUM_TURQUOISE,                 #   #49D2CC
      :MEDIUM_VIOLET_RED,                #   #C71685
      :MIDNIGHT_BLUE,                    #   #003366
      :MINT_CREAM,                       #   #F5FFFA
      :MINT_GREEN,                       #   #98FF98
      :MISTY_ROSE,                       #   #FFE5E2
      :MOCCASIN,                         #   #FFE5B5
      :MOSS_GREEN,                       #   #AEE0AE
      :MOUNTBATTEN_PINK,                 #   #997B8D
      :MUSTARD,                          #   #FFDC58
      :NAVAJO_WHITE,                     #   #FFDFAE
      :NAVY_BLUE,                        #   #000080
      :OCHRE,                            #   #CC7822
      :OLD_GOLD,                         #   #D0B53C
      :OLD_LACE,                         #   #FDF5E7
      :OLD_LAVENDER,                     #   #7A6979
      :OLD_ROSE,                         #   #C08081
      :OLIVE,                            #   #808000
      :OLIVE_DRAB,                       #   #6C8E23
      :ORANGE,                           #   #FF8000
      :ORANGE_COLOR_WHEEL,               #   #FF8000
      :ORANGE_PEEL,                      #   #FFA100
      :ORANGE_RED,                       #   #FF4600
      :ORANGE_WEB,                       #   #FFA600
      :ORCHID,                           #   #DB71D7
      :PALE_GOLDENROD,                   #   #EEE8AB
      :PALE_GREEN,                       #   #98FB98
      :PALE_TURQUOISE,                   #   #B0EEEE
      :PALE_VIOLET_RED,                  #   #DC7193
      :PAPAYA_WHIP,                      #   #FFEFD6
      :PASTEL_GREEN,                     #   #78DE78
      :PASTEL_PINK,                      #   #FFD2DD
      :PEACH,                            #   #FFE6B5
      :PEACH_ORANGE,                     #   #FFCC99
      :PEACH_PUFF,                       #   #FFDBB9
      :PEACH_YELLOW,                     #   #FAE0AE
      :PEAR,                             #   #D2E331
      :PERIWINKLE,                       #   #CCCCFF
      :PERSIAN_BLUE,                     #   #1C3ABB
      :PERSIAN_GREEN,                    #   #00A793
      :PERSIAN_INDIGO,                   #   #32127B
      :PERSIAN_PINK,                     #   #F780BE
      :PERSIAN_RED,                      #   #CC3333
      :PERSIAN_ROSE,                     #   #FF1CB2
      :PERU,                             #   #CD8540
      :PINE_GREEN,                       #   #017A70
      :PINK,                             #   #FFC0CB
      :PINK_ORANGE,                      #   #FF9966
      :PLUM,                             #   #DEA1DE
      :POMEGRANATE,                      #   #F34823
      :POWDER_BLUE,                      #   #B1E1E7
      :POWDER_BLUE_WEB,                  #   #B1E1E7
      :PRUSSIAN_BLUE,                    #   #003153
      :PUCE,                             #   #CC8899
      :PUMPKIN,                          #   #FF7618
      :PURPLE,                           #   #660099
      :RAW_UMBER,                        #   #744B12
      :RED,                              #   #FF0000
      :RED_VIOLET,                       #   #C71685
      :ROBIN_EGG_BLUE,                   #   #00CCCC
      :ROSE,                             #   #FF0080
      :ROSY_BROWN,                       #   #BC8F8F
      :ROYAL_BLUE,                       #   #426AE2
      :RUSSET,                           #   #80471B
      :RUST,                             #   #B7420E
      :SADDLE_BROWN,                     #   #8B4613
      :SAFETY_ORANGE,                    #   #FF6600
      :SAFFRON,                          #   #F4C430
      :SALMON,                           #   #FF8C6A
      :SANDY_BROWN,                      #   #F4A560
      :SANGRIA,                          #   #92000A
      :SAPPHIRE,                         #   #082567
      :SCARLET,                          #   #FF2400
      :SCHOOL_BUS_YELLOW,                #   #FFD900
      :SEA_GREEN,                        #   #2E8B57
      :SEASHELL,                         #   #FFF5EE
      :SELECTIVE_YELLOW,                 #   #FFBA00
      :SEPIA,                            #   #714314
      :SHOCKING_PINK,                    #   #FC0FC0
      :SIENNA,                           #   #A1522D
      :SILVER,                           #   #C0C0C0
      :SKY_BLUE,                         #   #87CEEB
      :SLATE_BLUE,                       #   #6B5ACD
      :SLATE_GRAY,                       #   #718090
      :SMALT,                            #   #003399
      :SNOW,                             #   #FFFAFA
      :SPRING_GREEN,                     #   #00FF80
      :STEEL_BLUE,                       #   #4782B5
      :SWAMP_GREEN,                      #   #ADB78E
      :TAN,                              #   #D3B58C
      :TANGERINE,                        #   #FFCC00
      :TAUPE,                            #   #493D32
      :TAWNY,                            #   #CD5700
      :TEA_GREEN,                        #   #D1F0C0
      :TEAL,                             #   #008080
      :TENNE,                            #   #CD5700
      :TERRA_COTTA,                      #   #E3735B
      :THISTLE,                          #   #D9BFD9
      :TOMATO,                           #   #FF6348
      :TURQUOISE,                        #   #30D6C8
      :ULTRAMARINE,                      #   #120A8F
      :VERMILION,                        #   #FF4D00
      :VIOLET,                           #   #8B00FF
      :VIOLET_EGGPLANT,                  #   #991299
      :VIRIDIAN,                         #   #41826E
      :WHEAT,                            #   #F5DFB3
      :WHITE,                            #   #FFFFFF
      :WHITE_SMOKE,                      #   #F5F5F5
      :WISTERIA,                         #   #C9A1DD
      :YELLOW,                           #   #FFFF00
      :YELLOW_GREEN,                     #   #9BCD32
      :ZINNWALDITE                       #   #EBC2B0
    ]
  end
end


Screen.new.show_all
Gtk.main

