
require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super(480, 600)
    setup
  end

  def setup
    @colors = [
      :ALICE_BLUE,                       #    #F0F8FF
      :ALIZARIN_CRIMSON,                 #    #E32636
      :AMARANTH,                         #    #E52B50
      :AMBER,                            #    #FFBF00
      :AMETHYST,                         #    #9966CC
      :ANTIQUE_WHITE,                    #    #FAEBD7
      :APRICOT,                          #    #FBCEB1
      :AQUA,                             #    #00FFFF
      :AQUAMARINE,                       #    #7FFFD4
      :ASPARAGUS,                        #    #7BA05B
      :AZURE,                            #    #007FFF/#F0FFFF
      :BEIGE,                            #    #F5F5DC
      :BISQUE,                           #    #FFE4C4
      :BISTRE,                           #    #3D2B1F
      :BLACK,                            #    #000000
      :BLANCHED_ALMOND,                  #    #FFEBCD
      :BLAZE_ORANGE,                     #    #FF6600
      :BLUE,                             #    #0000FF
      :BLUE_VIOLET,                      #    #8A2BE2
      :BONDI_BLUE,                       #    #0095B6
      :BRIGHT_GREEN,                     #    #66FF00
      :BRIGHT_TURQUOISE,                 #    #08E8DE
      :BROWN,                            #    #964B00/#A52A2A
      :BUFF,                             #    #F0DC82
      :BURGUNDY,                         #    #900020
      :BURLY_WOOD,                       #    #DEB887
      :BURNT_ORANGE,                     #    #CC5500
      :BURNT_SIENNA,                     #    #E97451
      :BURNT_UMBER,                      #    #8A3324
      :CADET_BLUE,                       #    #5F9EA0
      :CAMOUFLAGE_GREEN,                 #    #78866B
      :CARDINAL,                         #    #C41E3A
      :CARMINE,                          #    #960018
      :CARNATION,                        #    #F95A61
      :CARROT_ORANGE,                    #    #ED9121
      :CELADON,                          #    #ACE1AF
      :CERISE,                           #    #DE3163
      :CERULEAN,                         #    #007BA7
      :CERULEAN_BLUE,                    #    #2A52BE
      :CHARTREUSE,                       #    #7FFF00
      :CHARTREUSE_YELLOW,                #    #DFFF00
      :CHESTNUT,                         #    #CD5C5C
      :CHOCOLATE,                        #    #D2691E
      :CINNAMON,                         #    #7B3F00
      :COBALT,                           #    #0047AB
      :COPPER,                           #    #B87333
      :COPPER_ROSE,                      #    #996666
      :CORAL,                            #    #FF7F50
      :CORAL_RED,                        #    #FF4040
      :CORN,                             #    #FBEC5D
      :CORNFLOWER_BLUE,                  #    #6495ED
      :CORNSILK,                         #    #FFF8DC
      :CREAM,                            #    #FFFDD0
      :CRIMSON,                          #    #DC143C
      :CYAN,                             #    #00FFFF
      :DARK_BLUE,                        #    #0000C8/#00008B
      :DARK_CYAN,                        #    #008B8B
      :DARK_GOLDENROD,                   #    #B8860B
      :DARK_GRAY,                        #    #A9A9A9
      :DARK_GREEN,                       #    #006400
      :DARK_KHAKI,                       #    #BDB76B
      :DARK_MAGENTA,                     #    #8B008B
      :DARK_OLIVE_GREEN,                 #    #556B2F
      :DARK_ORANGE,                      #    #FF8C00
      :DARK_ORCHID,                      #    #9932CC
      :DARK_POWDER_BLUE,                 #    #003399
      :DARK_RED,                         #    #8B0000
      :DARK_SALMON,                      #    #E9967A
      :DARK_SEA_GREEN,                   #    #8FBC8F
      :DARK_SLATE_BLUE,                  #    #483D8B
      :DARK_SLATE_GRAY,                  #    #2F4F4F
      :DARK_TURQUOISE,                   #    #00CED1
      :DARK_VIOLET,                      #    #9400D3
      :DEEP_PINK,                        #    #FF1493
      :DEEP_SKY_BLUE,                    #    #00BFFF
      :DENIM,                            #    #1560BD
      :DIM_GRAY,                         #    #696969
      :DODGER_BLUE,                      #    #1E90FF
      :EGGPLANT,                         #    #990066
      :EMERALD,                          #    #50C878
      :FALU_RED,                         #    #801818
      :FERN_GREEN,                       #    #4F7942
      :FIRE_BRICK,                       #    #B22222
      :FLAX,                             #    #EEDC82
      :FLORAL_WHITE,                     #    #FFFAF0
      :FOREST_GREEN,                     #    #228B22
      :FRENCH_ROSE,                      #    #F64A8A
      :FUCHSIA,                          #    #FF00FF
      :GAINSBORO,                        #    #DCDCDC
      :GAMBOGE,                          #    #E49B0F
      :GHOST_WHITE,                      #    #F8F8FF
      :GOLD,                             #    #FFD700
      :GOLDENROD,                        #    #DAA520
      :GRAY,                             #    #808080/#BEBEBE
      :GRAY_ASPARAGUS,                   #    #465945
      :GREEN,                            #    #00FF00
      :GREEN_YELLOW,                     #    #ADFF2F
      :HARLEQUIN,                        #    #3FFF00
      :HELIOTROPE,                       #    #DF73FF
      :HOLLYWOOD_CERISE,                 #    #F400A1
      :HONEYDEW,                         #    #F0FFF0
      :HOT_MAGENTA,                      #    #FF00CC
      :HOT_PINK,                         #    #FF69B4
      :INDIAN_RED,                       #    #CD5C5C
      :INDIGO,                           #    #4B0082
      :INTERNATIONAL_KLEIN_BLUE,         #    #002FA7
      :INTERNATIONAL_ORANGE,             #    #FF4F00
      :IVORY,                            #    #FFFFF0
      :JADE,                             #    #00A86B
      :KHAKI,                            #    #C3B091/#F0E68C
      :KHAKI_X11,                        #    #F0E68C
      :LAVENDER,                         #    #B57EDC/#E6E6FA
      :LAVENDER_BLUE,                    #    #CCCCFF
      :LAVENDER_BLUSH,                   #    #FFF0F5
      :LAVENDER_GRAY,                    #    #BDBBD7
      :LAVENDER_PINK,                    #    #FBAED2
      :LAVENDER_ROSE,                    #    #FBA0E3
      :LAWN_GREEN,                       #    #7CFC00
      :LEMON,                            #    #FDE910
      :LEMON_CHIFFON,                    #    #FFFACD
      :LIGHT_BLUE,                       #    #ADD8E6
      :LIGHT_CORAL,                      #    #F08080
      :LIGHT_CYAN,                       #    #E0FFFF
      :LIGHT_GOLDENROD_YELLOW,           #    #FAFAD2
      :LIGHT_GREEN,                      #    #90EE90
      :LIGHT_GREY,                       #    #D3D3D3
      :LIGHT_PINK,                       #    #FFB6C1
      :LIGHT_SALMON,                     #    #FFA07A
      :LIGHT_SEA_GREEN,                  #    #20B2AA
      :LIGHT_SKY_BLUE,                   #    #87CEFA
      :LIGHT_SLATE_GRAY,                 #    #778899
      :LIGHT_STEEL_BLUE,                 #    #B0C4DE
      :LIGHT_YELLOW,                     #    #FFFFE0
      :LILAC,                            #    #C8A2C8
      :LIME,                             #    #BFFF00/#00FF00
      :LIME_GREEN,                       #    #32CD32
      :LINEN,                            #    #FAF0E6
      :MAGENTA,                          #    #FF00FF
      :MALACHITE,                        #    #0BDA51
      :MAROON,                           #    #800000/#B03060
      :MAUVE,                            #    #E0B0FF
      :MEDIUM_AQUAMARINE,                #    #66CDAA
      :MEDIUM_BLUE,                      #    #0000CD
      :MEDIUM_CARMINE,                   #    #AF4035
      :MEDIUM_LAVENDER,                  #    #EE82EE
      :MEDIUM_ORCHID,                    #    #BA55D3
      :MEDIUM_PURPLE,                    #    #9370DB
      :MEDIUM_SEA_GREEN,                 #    #3CB371
      :MEDIUM_SLATE_BLUE,                #    #7B68EE
      :MEDIUM_SPRING_GREEN,              #    #00FA9A
      :MEDIUM_TURQUOISE,                 #    #48D1CC
      :MEDIUM_VIOLET_RED,                #    #C71585
      :MIDNIGHT_BLUE,                    #    #003366/#191970
      :MINT_CREAM,                       #    #F5FFFA
      :MINT_GREEN,                       #    #98FF98
      :MISTY_ROSE,                       #    #FFE4E1
      :MOCCASIN,                         #    #FFE4B5
      :MOSS_GREEN,                       #    #ADDFAD
      :MOUNTBATTEN_PINK,                 #    #997A8D
      :MUSTARD,                          #    #FFDB58
      :NAVAJO_WHITE,                     #    #FFDEAD
      :NAVY_BLUE,                        #    #000080
      :OCHRE,                            #    #CC7722
      :OLD_GOLD,                         #    #CFB53B
      :OLD_LACE,                         #    #FDF5E6
      :OLD_LAVENDER,                     #    #796878
      :OLD_ROSE,                         #    #C08081
      :OLIVE,                            #    #808000
      :OLIVE_DRAB,                       #    #6B8E23
      :ORANGE,                           #    #FFA500
      :ORANGE_COLOR_WHEEL,               #    #FF7500
      :ORANGE_PEEL,                      #    #FFA000
      :ORANGE_RED,                       #    #FF4500
      :ORANGE_WEB,                       #    #FFA500
      :ORCHID,                           #    #DA70D6
      :PALE_GOLDENROD,                   #    #EEE8AA
      :PALE_GREEN,                       #    #98FB98
      :PALE_TURQUOISE,                   #    #AFEEEE
      :PALE_VIOLET_RED,                  #    #DB7093
      :PAPAYA_WHIP,                      #    #FFEFD5
      :PASTEL_GREEN,                     #    #77DD77
      :PASTEL_PINK,                      #    #FFD1DC
      :PEACH,                            #    #FFE5B4
      :PEACH_ORANGE,                     #    #FFCC99
      :PEACH_PUFF,                       #    #FFDAB9
      :PEACH_YELLOW,                     #    #FADFAD
      :PEAR,                             #    #D1E231
      :PERIWINKLE,                       #    #CCCCFF
      :PERSIAN_BLUE,                     #    #1C39BB
      :PERSIAN_GREEN,                    #    #00A693
      :PERSIAN_INDIGO,                   #    #32127A
      :PERSIAN_PINK,                     #    #F77FBE
      :PERSIAN_RED,                      #    #CC3333
      :PERSIAN_ROSE,                     #    #FF1CB1
      :PERU,                             #    #CD853F
      :PINE_GREEN,                       #    #01796F
      :PINK,                             #    #FFC0CB
      :PINK_ORANGE,                      #    #FF9966
      :PLUM,                             #    #DDA0DD
      :POMEGRANATE,                      #    #F34723
      :POWDER_BLUE,                      #    #B0E0E6
      :POWDER_BLUE_WEB,                  #    #B0E0E6
      :PRUSSIAN_BLUE,                    #    #003153
      :PUCE,                             #    #CC8899
      :PUMPKIN,                          #    #FF7518
      :PURPLE,                           #    #660099/#A020F0
      :RAW_UMBER,                        #    #734A12
      :RED,                              #    #FF0000
      :RED_VIOLET,                       #    #C71585
      :ROBIN_EGG_BLUE,                   #    #00CCCC
      :ROSE,                             #    #FF007F
      :ROSY_BROWN,                       #    #BC8F8F
      :ROYAL_BLUE,                       #    #4169E1
      :RUSSET,                           #    #80461B
      :RUST,                             #    #B7410E
      :SADDLE_BROWN,                     #    #8B4513
      :SAFETY_ORANGE,                    #    #FF6600
      :SAFFRON,                          #    #F4C430
      :SALMON,                           #    #FF8C69/#FA8072
      :SANDY_BROWN,                      #    #F4A460
      :SANGRIA,                          #    #92000A
      :SAPPHIRE,                         #    #082567
      :SCARLET,                          #    #FF2400
      :SCHOOL_BUS_YELLOW,                #    #FFD800
      :SEA_GREEN,                        #    #2E8B57
      :SEASHELL,                         #    #FFF5EE
      :SELECTIVE_YELLOW,                 #    #FFBA00
      :SEPIA,                            #    #704214
      :SHOCKING_PINK,                    #    #FC0FC0
      :SIENNA,                           #    #A0522D
      :SILVER,                           #    #C0C0C0
      :SKY_BLUE,                         #    #87CEEB
      :SLATE_BLUE,                       #    #6A5ACD
      :SLATE_GRAY,                       #    #708090
      :SMALT,                            #    #003399
      :SNOW,                             #    #FFFAFA
      :SPRING_GREEN,                     #    #00FF7F
      :STEEL_BLUE,                       #    #4682B4
      :SWAMP_GREEN,                      #    #ACB78E
      :TAN,                              #    #D2B48C
      :TANGERINE,                        #    #FFCC00
      :TAUPE,                            #    #483C32
      :TAWNY,                            #    #CD5700
      :TEA_GREEN,                        #    #D0F0C0
      :TEAL,                             #    #008080
      :TENNE,                            #    #CD5700
      :TERRA_COTTA,                      #    #E2725B
      :THISTLE,                          #    #D8BFD8
      :TOMATO,                           #    #FF6347
      :TURQUOISE,                        #    #30D5C8/#40E0D0
      :ULTRAMARINE,                      #    #120A8F
      :VERMILION,                        #    #FF4D00
      :VIOLET,                           #    #8B00FF/#EE82EE
      :VIOLET_EGGPLANT,                  #    #991199
      :VIRIDIAN,                         #    #40826D
      :WHEAT,                            #    #F5DEB3
      :WHITE,                            #    #FFFFFF
      :WHITE_SMOKE,                      #    #F5F5F5
      :WISTERIA,                         #    #C9A0DC
      :YELLOW,                           #    #FFFF00
      :YELLOW_GREEN,                     #    #9ACD32
      :ZINNWALDITE                       #    #EBC2AF
    ]
    @start_index = 0
    @bar_w       = 200
    @bar_h       =  30
  end

  def draw
    @colors.each_with_index do |c, i|
      next if i < @start_index
      y =  (i - @start_index) * @bar_h
      Nyle.draw_rect(0, y, @bar_w, @bar_h, {color: c, fill: true})
      Nyle.draw_text(@bar_w + 10, y + @bar_h - 10, c.to_s, {color: :BLACK, size: 16})
    end
  end

  def update
    if Nyle.key_press?(KEY_Up)
      @start_index -= (@height / @bar_h)
      @start_index = (@colors.length / (@height / @bar_h)) * (@height / @bar_h) if @start_index < 0
      # puts "#{@start_index} #{@colors.length}"
    end

    if Nyle.key_press?(KEY_Down)
      @start_index += (@height / @bar_h)
      @start_index = 0 if @start_index >= @colors.length
      # puts "#{@start_index} #{@colors.length}"
    end

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end
end


Screen.new.show_all
Gtk.main

