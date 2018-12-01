
require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super(480, 600)
    setup
  end

  def setup
    @colors = [
      :ALICE_BLUE,                       #   #F0F8FFFF
      :ALIZARIN_CRIMSON,                 #   #E32637FF
      :AMARANTH,                         #   #E62B50FF
      :AMBER,                            #   #FFBF00FF
      :AMETHYST,                         #   #9966CCFF
      :ANTIQUE_WHITE,                    #   #FAEBD8FF
      :APRICOT,                          #   #FBCEB2FF
      :AQUA,                             #   #00FFFFFF
      :AQUAMARINE,                       #   #80FFD5FF
      :ASPARAGUS,                        #   #7CA15BFF
      :AZURE,                            #   #0080FFFF
      :BEIGE,                            #   #F5F5DDFF
      :BISQUE,                           #   #FFE5C4FF
      :BISTRE,                           #   #3E2B1FFF
      :BLACK,                            #   #000000FF
      :BLANCHED_ALMOND,                  #   #FFEBCDFF
      :BLAZE_ORANGE,                     #   #FF6600FF
      :BLUE,                             #   #0000FFFF
      :BLUE_VIOLET,                      #   #8A2BE3FF
      :BONDI_BLUE,                       #   #0095B6FF
      :BRIGHT_GREEN,                     #   #66FF00FF
      :BRIGHT_TURQUOISE,                 #   #08E8DFFF
      :BROWN,                            #   #964C00FF
      :BUFF,                             #   #F0DD82FF
      :BURGUNDY,                         #   #800020FF
      :BURLY_WOOD,                       #   #DFB887FF
      :BURNT_ORANGE,                     #   #CC5500FF
      :BURNT_SIENNA,                     #   #E97551FF
      :BURNT_UMBER,                      #   #8A3324FF
      :CADET_BLUE,                       #   #5F9FA1FF
      :CAMOUFLAGE_GREEN,                 #   #79866CFF
      :CARDINAL,                         #   #C41E3BFF
      :CARMINE,                          #   #960018FF
      :CARNATION,                        #   #F95A61FF
      :CARROT_ORANGE,                    #   #ED9121FF
      :CELADON,                          #   #ADE2B0FF
      :CERISE,                           #   #DF3163FF
      :CERULEAN,                         #   #007CA8FF
      :CERULEAN_BLUE,                    #   #2A52BEFF
      :CHARTREUSE,                       #   #80FF00FF
      :CHARTREUSE_YELLOW,                #   #E0FF00FF
      :CHESTNUT,                         #   #CD5C5CFF
      :CHOCOLATE,                        #   #D36A1EFF
      :CINNAMON,                         #   #7C4000FF
      :COBALT,                           #   #0048ACFF
      :COPPER,                           #   #B87433FF
      :COPPER_ROSE,                      #   #996666FF
      :CORAL,                            #   #FF8050FF
      :CORAL_RED,                        #   #FF4141FF
      :CORN,                             #   #FBEC5DFF
      :CORNFLOWER_BLUE,                  #   #6495EDFF
      :CORNSILK,                         #   #FFF8DDFF
      :CREAM,                            #   #FFFDD1FF
      :CRIMSON,                          #   #DD143DFF
      :CYAN,                             #   #00FFFFFF
      :DARK_BLUE,                        #   #00008BFF
      :DARK_CYAN,                        #   #008B8BFF
      :DARK_GOLDENROD,                   #   #B8860CFF
      :DARK_GRAY,                        #   #AAAAAAFF
      :DARK_GREEN,                       #   #006400FF
      :DARK_KHAKI,                       #   #BDB76CFF
      :DARK_MAGENTA,                     #   #8B008BFF
      :DARK_OLIVE_GREEN,                 #   #556C2FFF
      :DARK_ORANGE,                      #   #FF8C00FF
      :DARK_ORCHID,                      #   #9932CCFF
      :DARK_POWDER_BLUE,                 #   #003399FF
      :DARK_RED,                         #   #8B0000FF
      :DARK_SALMON,                      #   #E9967BFF
      :DARK_SEA_GREEN,                   #   #8FBC8FFF
      :DARK_SLATE_BLUE,                  #   #493E8BFF
      :DARK_SLATE_GRAY,                  #   #2F4F4FFF
      :DARK_TURQUOISE,                   #   #00CED2FF
      :DARK_VIOLET,                      #   #9400D4FF
      :DEEP_PINK,                        #   #FF1493FF
      :DEEP_SKY_BLUE,                    #   #00BFFFFF
      :DENIM,                            #   #1660BDFF
      :DIM_GRAY,                         #   #6A6A6AFF
      :DODGER_BLUE,                      #   #1E90FFFF
      :EGGPLANT,                         #   #990066FF
      :EMERALD,                          #   #50C879FF
      :FALU_RED,                         #   #801818FF
      :FERN_GREEN,                       #   #4F7A43FF
      :FIRE_BRICK,                       #   #B22222FF
      :FLAX,                             #   #EEDD82FF
      :FLORAL_WHITE,                     #   #FFFAF0FF
      :FOREST_GREEN,                     #   #228B22FF
      :FRENCH_ROSE,                      #   #F64B8AFF
      :FUCHSIA,                          #   #FF00FFFF
      :GAINSBORO,                        #   #DDDDDDFF
      :GAMBOGE,                          #   #E59C0FFF
      :GHOST_WHITE,                      #   #F8F8FFFF
      :GOLD,                             #   #FFD800FF
      :GOLDENROD,                        #   #DBA620FF
      :GRAY,                             #   #808080FF
      :GRAY_ASPARAGUS,                   #   #475946FF
      :GREEN,                            #   #00FF00FF
      :GREEN_YELLOW,                     #   #AEFF2FFF
      :HARLEQUIN,                        #   #40FF00FF
      :HELIOTROPE,                       #   #E074FFFF
      :HOLLYWOOD_CERISE,                 #   #F400A2FF
      :HONEYDEW,                         #   #F0FFF0FF
      :HOT_MAGENTA,                      #   #FF00CCFF
      :HOT_PINK,                         #   #FF6AB5FF
      :INDIAN_RED,                       #   #CD5C5CFF
      :INDIGO,                           #   #4C0082FF
      :INTERNATIONAL_KLEIN_BLUE,         #   #002FA8FF
      :INTERNATIONAL_ORANGE,             #   #FF4F00FF
      :IVORY,                            #   #FFFFF0FF
      :JADE,                             #   #00A96CFF
      :KHAKI,                            #   #C3B191FF
      :KHAKI_X11,                        #   #F0E78CFF
      :LAVENDER,                         #   #B57FDDFF
      :LAVENDER_BLUE,                    #   #CCCCFFFF
      :LAVENDER_BLUSH,                   #   #FFF0F5FF
      :LAVENDER_GRAY,                    #   #BDBBD8FF
      :LAVENDER_PINK,                    #   #FBAFD3FF
      :LAVENDER_ROSE,                    #   #FBA1E3FF
      :LAWN_GREEN,                       #   #7DFC00FF
      :LEMON,                            #   #FDE911FF
      :LEMON_CHIFFON,                    #   #FFFACDFF
      :LIGHT_BLUE,                       #   #AED9E7FF
      :LIGHT_CORAL,                      #   #F08080FF
      :LIGHT_CYAN,                       #   #E1FFFFFF
      :LIGHT_GOLDENROD_YELLOW,           #   #FAFAD3FF
      :LIGHT_GREEN,                      #   #90EE90FF
      :LIGHT_GREY,                       #   #D4D4D4FF
      :LIGHT_PINK,                       #   #FFB6C1FF
      :LIGHT_SALMON,                     #   #FFA17BFF
      :LIGHT_SEA_GREEN,                  #   #20B2ABFF
      :LIGHT_SKY_BLUE,                   #   #87CEFAFF
      :LIGHT_SLATE_GRAY,                 #   #788899FF
      :LIGHT_STEEL_BLUE,                 #   #B1C4DFFF
      :LIGHT_YELLOW,                     #   #FFFFE1FF
      :LILAC,                            #   #C8A3C8FF
      :LIME,                             #   #BFFF00FF
      :LIME_GREEN,                       #   #32CD32FF
      :LINEN,                            #   #FAF0E7FF
      :MAGENTA,                          #   #FF00FFFF
      :MALACHITE,                        #   #0CDB51FF
      :MAROON,                           #   #800000FF
      :MAUVE,                            #   #E1B1FFFF
      :MEDIUM_AQUAMARINE,                #   #66CDABFF
      :MEDIUM_BLUE,                      #   #0000CDFF
      :MEDIUM_CARMINE,                   #   #B04136FF
      :MEDIUM_LAVENDER,                  #   #EE82EEFF
      :MEDIUM_ORCHID,                    #   #BA55D4FF
      :MEDIUM_PURPLE,                    #   #9371DCFF
      :MEDIUM_SEA_GREEN,                 #   #3DB372FF
      :MEDIUM_SLATE_BLUE,                #   #7C69EEFF
      :MEDIUM_SPRING_GREEN,              #   #00FA9BFF
      :MEDIUM_TURQUOISE,                 #   #49D2CCFF
      :MEDIUM_VIOLET_RED,                #   #C71685FF
      :MIDNIGHT_BLUE,                    #   #003366FF
      :MINT_CREAM,                       #   #F5FFFAFF
      :MINT_GREEN,                       #   #98FF98FF
      :MISTY_ROSE,                       #   #FFE5E2FF
      :MOCCASIN,                         #   #FFE5B5FF
      :MOSS_GREEN,                       #   #AEE0AEFF
      :MOUNTBATTEN_PINK,                 #   #997B8DFF
      :MUSTARD,                          #   #FFDC58FF
      :NAVAJO_WHITE,                     #   #FFDFAEFF
      :NAVY_BLUE,                        #   #000080FF
      :OCHRE,                            #   #CC7822FF
      :OLD_GOLD,                         #   #D0B53CFF
      :OLD_LACE,                         #   #FDF5E7FF
      :OLD_LAVENDER,                     #   #7A6979FF
      :OLD_ROSE,                         #   #C08081FF
      :OLIVE,                            #   #808000FF
      :OLIVE_DRAB,                       #   #6C8E23FF
      :ORANGE,                           #   #FF8000FF
      :ORANGE_COLOR_WHEEL,               #   #FF8000FF
      :ORANGE_PEEL,                      #   #FFA100FF
      :ORANGE_RED,                       #   #FF4600FF
      :ORANGE_WEB,                       #   #FFA600FF
      :ORCHID,                           #   #DB71D7FF
      :PALE_GOLDENROD,                   #   #EEE8ABFF
      :PALE_GREEN,                       #   #98FB98FF
      :PALE_TURQUOISE,                   #   #B0EEEEFF
      :PALE_VIOLET_RED,                  #   #DC7193FF
      :PAPAYA_WHIP,                      #   #FFEFD6FF
      :PASTEL_GREEN,                     #   #78DE78FF
      :PASTEL_PINK,                      #   #FFD2DDFF
      :PEACH,                            #   #FFE6B5FF
      :PEACH_ORANGE,                     #   #FFCC99FF
      :PEACH_PUFF,                       #   #FFDBB9FF
      :PEACH_YELLOW,                     #   #FAE0AEFF
      :PEAR,                             #   #D2E331FF
      :PERIWINKLE,                       #   #CCCCFFFF
      :PERSIAN_BLUE,                     #   #1C3ABBFF
      :PERSIAN_GREEN,                    #   #00A793FF
      :PERSIAN_INDIGO,                   #   #32127BFF
      :PERSIAN_PINK,                     #   #F780BEFF
      :PERSIAN_RED,                      #   #CC3333FF
      :PERSIAN_ROSE,                     #   #FF1CB2FF
      :PERU,                             #   #CD8540FF
      :PINE_GREEN,                       #   #017A70FF
      :PINK,                             #   #FFC0CBFF
      :PINK_ORANGE,                      #   #FF9966FF
      :PLUM,                             #   #DEA1DEFF
      :POMEGRANATE,                      #   #F34823FF
      :POWDER_BLUE,                      #   #B1E1E7FF
      :POWDER_BLUE_WEB,                  #   #B1E1E7FF
      :PRUSSIAN_BLUE,                    #   #003153FF
      :PUCE,                             #   #CC8899FF
      :PUMPKIN,                          #   #FF7618FF
      :PURPLE,                           #   #660099FF
      :RAW_UMBER,                        #   #744B12FF
      :RED,                              #   #FF0000FF
      :RED_VIOLET,                       #   #C71685FF
      :ROBIN_EGG_BLUE,                   #   #00CCCCFF
      :ROSE,                             #   #FF0080FF
      :ROSY_BROWN,                       #   #BC8F8FFF
      :ROYAL_BLUE,                       #   #426AE2FF
      :RUSSET,                           #   #80471BFF
      :RUST,                             #   #B7420EFF
      :SADDLE_BROWN,                     #   #8B4613FF
      :SAFETY_ORANGE,                    #   #FF6600FF
      :SAFFRON,                          #   #F4C430FF
      :SALMON,                           #   #FF8C6AFF
      :SANDY_BROWN,                      #   #F4A560FF
      :SANGRIA,                          #   #92000AFF
      :SAPPHIRE,                         #   #082567FF
      :SCARLET,                          #   #FF2400FF
      :SCHOOL_BUS_YELLOW,                #   #FFD900FF
      :SEA_GREEN,                        #   #2E8B57FF
      :SEASHELL,                         #   #FFF5EEFF
      :SELECTIVE_YELLOW,                 #   #FFBA00FF
      :SEPIA,                            #   #714314FF
      :SHOCKING_PINK,                    #   #FC0FC0FF
      :SIENNA,                           #   #A1522DFF
      :SILVER,                           #   #C0C0C0FF
      :SKY_BLUE,                         #   #87CEEBFF
      :SLATE_BLUE,                       #   #6B5ACDFF
      :SLATE_GRAY,                       #   #718090FF
      :SMALT,                            #   #003399FF
      :SNOW,                             #   #FFFAFAFF
      :SPRING_GREEN,                     #   #00FF80FF
      :STEEL_BLUE,                       #   #4782B5FF
      :SWAMP_GREEN,                      #   #ADB78EFF
      :TAN,                              #   #D3B58CFF
      :TANGERINE,                        #   #FFCC00FF
      :TAUPE,                            #   #493D32FF
      :TAWNY,                            #   #CD5700FF
      :TEA_GREEN,                        #   #D1F0C0FF
      :TEAL,                             #   #008080FF
      :TENNE,                            #   #CD5700FF
      :TERRA_COTTA,                      #   #E3735BFF
      :THISTLE,                          #   #D9BFD9FF
      :TOMATO,                           #   #FF6348FF
      :TURQUOISE,                        #   #30D6C8FF
      :ULTRAMARINE,                      #   #120A8FFF
      :VERMILION,                        #   #FF4D00FF
      :VIOLET,                           #   #8B00FFFF
      :VIOLET_EGGPLANT,                  #   #991299FF
      :VIRIDIAN,                         #   #41826EFF
      :WHEAT,                            #   #F5DFB3FF
      :WHITE,                            #   #FFFFFFFF
      :WHITE_SMOKE,                      #   #F5F5F5FF
      :WISTERIA,                         #   #C9A1DDFF
      :YELLOW,                           #   #FFFF00FF
      :YELLOW_GREEN,                     #   #9BCD32FF
      :ZINNWALDITE                       #   #EBC2B0FF
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
      Nyle.draw_text(@bar_w + 10, y + @bar_h - 10, "#{c.to_s}", {color: :BLACK, size: 16})
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

    if Nyle.key_press?(KEY_space)
      @colors.each do |c|
        puts "#{Cairo::Color.parse(c).to_s} (#{c.to_s})"
      end
    end

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end
end


Screen.new.show_all
Gtk.main

