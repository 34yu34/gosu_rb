require 'gosu'
require_relative 'module/layer'
require_relative 'static_text'
include Gosu

class Buton < Static_Text
  def initialize(text, height, width, pos_x, pos_y, link)
    super(text, height, width, pos_x, pos_y)
    @link = link
  end

  def next_pos_x
    @x2
  end

  def next_pos_y
    @y2
  end

  attr_reader :link

  def hover(mouse_x, mouse_y)
    @image.draw(@x1, @y1, Layer::BOARD, 1, 1, Color::RED) if inside?(mouse_x, mouse_y)
  end

  def click?(mouse_x, mouse_y)
    if inside?(mouse_x, mouse_y)
      return button_down?(MS_LEFT)
    end
    false
  end

  def inside?(mouse_x, mouse_y)
    (mouse_x > @x1 && mouse_x < @x2) && (mouse_y < @y2 && mouse_y > @y1)
  end
end
