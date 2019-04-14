require 'nyle'

class Screen < Nyle::Screen
  def initialize
    super(600, 600)
    setup
  end

  def setup
    @colors         = _color_list
    @bar_w          = 200
    @bar_h          =  30
    @items_per_page = Nyle.screen_height / @bar_h
    @pages          = @colors.length / @items_per_page + (@colors.length % @items_per_page == 0 ? 0 : 1)
    @start_index    =   0
    @end_index      = _end_index
  end

  def draw
    (@start_index..@end_index).each do |i|
      y =  (i - @start_index) * @bar_h
      Nyle.draw_rect(0, y, @bar_w, @bar_h, {color: @colors[i], fill: true})
      Nyle.draw_text(@bar_w +  10, y + @bar_h - 10, "(#{Cairo::Color.module_eval(@colors[i].to_s).to_s[0..6]})", {font: "monospace",             color: :BLACK, size: 16})
      Nyle.draw_text(@bar_w + 110, y + @bar_h - 10, "#{@colors[i].to_s}",                                        {font: "monospace", bold: true, color: :BLACK, size: 16})
    end
  end

  def update
    if Nyle.key_press?(KEY_Up) or Nyle.mouse_press?(MOUSE_R)
      @start_index -= (Nyle.screen_height / @bar_h)
      @start_index = @items_per_page * (@pages - 1) if @start_index < 0
      @end_index   = _end_index
    end

    if Nyle.key_press?(KEY_Down) or Nyle.mouse_press?(MOUSE_L)
      @start_index += @items_per_page
      @start_index = 0 if @start_index >= @colors.length
      @end_index   = _end_index
    end

    Nyle.quit if Nyle.key_press?(KEY_Escape)
  end

  def _end_index
    index = @start_index + @items_per_page - 1
    index = @colors.length - 1 if index >= @colors.length
    index
  end

  def _color_list
    [
      :ALICE_BLUE,                       #   
     #:ALIZARIN_CRIMSON,                 #   
      :AMARANTH,                         #   
      :AMBER,                            #   
      :AMETHYST,                         #   
      :ANTIQUE_WHITE,                    #   
      :APRICOT,                          #   
      :AQUA,                             #   
      :AQUAMARINE,                       #   
      :ASPARAGUS,                        #   
      :AZURE,                            #   
      :BEIGE,                            #   
      :BISQUE,                           #   
      :BISTRE,                           #   
      :BLACK,                            #   
      :BLANCHED_ALMOND,                  #   
     #:BLAZE_ORANGE,                     #   
      :BLUE,                             #   
      :BLUE_VIOLET,                      #   
      :BONDI_BLUE,                       #   
      :BRIGHT_GREEN,                     #   
      :BRIGHT_TURQUOISE,                 #   
      :BROWN,                            #   
      :BUFF,                             #   
      :BURGUNDY,                         #   
     #:BURLY_WOOD,                       #   
      :BURNT_ORANGE,                     #   
      :BURNT_SIENNA,                     #   
      :BURNT_UMBER,                      #   
      :CADET_BLUE,                       #   
      :CAMOUFLAGE_GREEN,                 #   
      :CARDINAL,                         #   
      :CARMINE,                          #   
     #:CARNATION,                        #   
      :CARROT_ORANGE,                    #   
      :CELADON,                          #   
      :CERISE,                           #   
      :CERULEAN,                         #   
      :CERULEAN_BLUE,                    #   
      :CHARTREUSE,                       #   
     #:CHARTREUSE_YELLOW,                #   
      :CHESTNUT,                         #   
      :CHOCOLATE,                        #   
      :CINNAMON,                         #   
     #:COBALT,                           #   
      :COPPER,                           #   
      :COPPER_ROSE,                      #   
      :CORAL,                            #   
      :CORAL_RED,                        #   
      :CORN,                             #   
      :CORNFLOWER_BLUE,                  #   
      :CORNSILK,                         #   
      :CREAM,                            #   
      :CRIMSON,                          #   
      :CYAN,                             #   
      :DARK_BLUE,                        #   
      :DARK_CYAN,                        #   
      :DARK_GOLDENROD,                   #   
      :DARK_GRAY,                        #   
      :DARK_GREEN,                       #   
      :DARK_KHAKI,                       #   
      :DARK_MAGENTA,                     #   
      :DARK_OLIVE_GREEN,                 #   
      :DARK_ORANGE,                      #   
      :DARK_ORCHID,                      #   
      :DARK_POWDER_BLUE,                 #   
      :DARK_RED,                         #   
      :DARK_SALMON,                      #   
      :DARK_SEA_GREEN,                   #   
      :DARK_SLATE_BLUE,                  #   
      :DARK_SLATE_GRAY,                  #   
      :DARK_TURQUOISE,                   #   
      :DARK_VIOLET,                      #   
      :DEEP_PINK,                        #   
      :DEEP_SKY_BLUE,                    #   
      :DENIM,                            #   
      :DIM_GRAY,                         #   
      :DODGER_BLUE,                      #   
      :EGGPLANT,                         #   
      :EMERALD,                          #   
      :FALU_RED,                         #   
      :FERN_GREEN,                       #   
     #:FIRE_BRICK,                       #   
      :FLAX,                             #   
      :FLORAL_WHITE,                     #   
      :FOREST_GREEN,                     #   
      :FRENCH_ROSE,                      #   
      :FUCHSIA,                          #   
      :GAINSBORO,                        #   
      :GAMBOGE,                          #   
      :GHOST_WHITE,                      #   
      :GOLD,                             #   
      :GOLDENROD,                        #   
      :GRAY,                             #   
      :GRAY_ASPARAGUS,                   #   
      :GREEN,                            #   
      :GREEN_YELLOW,                     #   
      :HARLEQUIN,                        #   
      :HELIOTROPE,                       #   
      :HOLLYWOOD_CERISE,                 #   
      :HONEYDEW,                         #   
      :HOT_MAGENTA,                      #   
      :HOT_PINK,                         #   
      :INDIAN_RED,                       #   
      :INDIGO,                           #   
      :INTERNATIONAL_KLEIN_BLUE,         #   
     #:INTERNATIONAL_ORANGE,             #   
      :IVORY,                            #   
      :JADE,                             #   
      :KHAKI,                            #   
      :KHAKI_X11,                        #   
      :LAVENDER,                         #   
      :LAVENDER_BLUE,                    #   
      :LAVENDER_BLUSH,                   #   
      :LAVENDER_GRAY,                    #   
      :LAVENDER_PINK,                    #   
      :LAVENDER_ROSE,                    #   
      :LAWN_GREEN,                       #   
      :LEMON,                            #   
      :LEMON_CHIFFON,                    #   
      :LIGHT_BLUE,                       #   
      :LIGHT_CORAL,                      #   
      :LIGHT_CYAN,                       #   
      :LIGHT_GOLDENROD_YELLOW,           #   
      :LIGHT_GREEN,                      #   
     #:LIGHT_GREY,                       #   
      :LIGHT_PINK,                       #   
      :LIGHT_SALMON,                     #   
      :LIGHT_SEA_GREEN,                  #   
      :LIGHT_SKY_BLUE,                   #   
      :LIGHT_SLATE_GRAY,                 #   
      :LIGHT_STEEL_BLUE,                 #   
      :LIGHT_YELLOW,                     #   
      :LILAC,                            #   
      :LIME,                             #   
      :LIME_GREEN,                       #   
      :LINEN,                            #   
      :MAGENTA,                          #   
      :MALACHITE,                        #   
      :MAROON,                           #   
      :MAUVE,                            #   
      :MEDIUM_AQUAMARINE,                #   
      :MEDIUM_BLUE,                      #   
      :MEDIUM_CARMINE,                   #   
     #:MEDIUM_LAVENDER,                  #   
      :MEDIUM_ORCHID,                    #   
      :MEDIUM_PURPLE,                    #   
      :MEDIUM_SEA_GREEN,                 #   
      :MEDIUM_SLATE_BLUE,                #   
      :MEDIUM_SPRING_GREEN,              #   
      :MEDIUM_TURQUOISE,                 #   
      :MEDIUM_VIOLET_RED,                #   
      :MIDNIGHT_BLUE,                    #   
      :MINT_CREAM,                       #   
      :MINT_GREEN,                       #   
      :MISTY_ROSE,                       #   
      :MOCCASIN,                         #   
      :MOSS_GREEN,                       #   
      :MOUNTBATTEN_PINK,                 #   
      :MUSTARD,                          #   
      :NAVAJO_WHITE,                     #   
      :NAVY_BLUE,                        #   
      :OCHRE,                            #   
      :OLD_GOLD,                         #   
      :OLD_LACE,                         #   
      :OLD_LAVENDER,                     #   
      :OLD_ROSE,                         #   
      :OLIVE,                            #   
      :OLIVE_DRAB,                       #   
      :ORANGE,                           #   
      :ORANGE_COLOR_WHEEL,               #   
      :ORANGE_PEEL,                      #   
      :ORANGE_RED,                       #   
      :ORANGE_WEB,                       #   
      :ORCHID,                           #   
      :PALE_GOLDENROD,                   #   
      :PALE_GREEN,                       #   
      :PALE_TURQUOISE,                   #   
      :PALE_VIOLET_RED,                  #   
      :PAPAYA_WHIP,                      #   
      :PASTEL_GREEN,                     #   
      :PASTEL_PINK,                      #   
      :PEACH,                            #   
      :PEACH_ORANGE,                     #   
      :PEACH_PUFF,                       #   
      :PEACH_YELLOW,                     #   
      :PEAR,                             #   
      :PERIWINKLE,                       #   
      :PERSIAN_BLUE,                     #   
      :PERSIAN_GREEN,                    #   
      :PERSIAN_INDIGO,                   #   
      :PERSIAN_PINK,                     #   
      :PERSIAN_RED,                      #   
      :PERSIAN_ROSE,                     #   
      :PERU,                             #   
      :PINE_GREEN,                       #   
      :PINK,                             #   
      :PINK_ORANGE,                      #   
      :PLUM,                             #   
     #:POMEGRANATE,                      #   
      :POWDER_BLUE,                      #   
     #:POWDER_BLUE_WEB,                  #   
      :PRUSSIAN_BLUE,                    #   
      :PUCE,                             #   
      :PUMPKIN,                          #   
      :PURPLE,                           #   
      :RAW_UMBER,                        #   
      :RED,                              #   
      :RED_VIOLET,                       #   
      :ROBIN_EGG_BLUE,                   #   
      :ROSE,                             #   
      :ROSY_BROWN,                       #   
      :ROYAL_BLUE,                       #   
      :RUSSET,                           #   
      :RUST,                             #   
      :SADDLE_BROWN,                     #   
      :SAFETY_ORANGE,                    #   
      :SAFFRON,                          #   
      :SALMON,                           #   
      :SANDY_BROWN,                      #   
     #:SANGRIA,                          #   
      :SAPPHIRE,                         #   
      :SCARLET,                          #   
      :SCHOOL_BUS_YELLOW,                #   
      :SEA_GREEN,                        #   
      :SEASHELL,                         #   
      :SELECTIVE_YELLOW,                 #   
      :SEPIA,                            #   
      :SHOCKING_PINK,                    #   
      :SIENNA,                           #   
      :SILVER,                           #   
      :SKY_BLUE,                         #   
      :SLATE_BLUE,                       #   
      :SLATE_GRAY,                       #   
     #:SMALT,                            #   
      :SNOW,                             #   
      :SPRING_GREEN,                     #   
      :STEEL_BLUE,                       #   
     #:SWAMP_GREEN,                      #   
      :TAN,                              #   
      :TANGERINE,                        #   
      :TAUPE,                            #   
      :TAWNY,                            #   
      :TEA_GREEN,                        #   
      :TEAL,                             #   
     #:TENNE,                            #   
      :TERRA_COTTA,                      #   
      :THISTLE,                          #   
      :TOMATO,                           #   
      :TURQUOISE,                        #   
      :ULTRAMARINE,                      #   
      :VERMILION,                        #   
      :VIOLET,                           #   
     #:VIOLET_EGGPLANT,                  #   
      :VIRIDIAN,                         #   
      :WHEAT,                            #   
      :WHITE,                            #   
      :WHITE_SMOKE,                      #   
      :WISTERIA,                         #   
      :YELLOW,                           #   
      :YELLOW_GREEN,                     #   
      :ZINNWALDITE                       #   
    ]
  end
end


Screen.new.show_all
Nyle.main

