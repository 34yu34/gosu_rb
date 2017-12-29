require 'gosu'
require_relative 'module/layer'
require_relative 'static_text'
include Gosu

class Static_Button < Static_Text
  attr_reader :link

  def initialize(text, height, width, pos_x, pos_y, link)
    super(text, height, width, pos_x, pos_y)
    @link = link
  end


  def hover(mouse_x, mouse_y)
    @image.draw(@left_x, @top_y, Layer::BOARD, 1, 1, Color::RED) if inside?(mouse_x, mouse_y)
  end

  def click?(mouse_x, mouse_y)
    if inside?(mouse_x, mouse_y)
      return button_down?(MS_LEFT)
    end
    false
  end

  def inside?(mouse_x, mouse_y)
    (mouse_x > @left_x && mouse_x < @right_x) && (mouse_y < @bottom_y && mouse_y > @top_y)
  end
end
