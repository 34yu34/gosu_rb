require 'gosu'
require_relative 'module/layer'
include Gosu


class Tile
  COLOR_LINE = Color::BLACK
  COLOR_BACK = Color::WHITE
  COLOR_HOVER = Color::GRAY

  def initialize(left_x, right_x, top_y, bottom_y)
    @left_x = left_x
    @right_x = right_x
    @top_y = top_y
    @bottom_y = bottom_y
  end

  def draw
    draw_quad(@left_x, @top_y, COLOR_BACK,
              @left_x, @bottom_y, COLOR_BACK,
              @right_x, @bottom_y, COLOR_BACK,
              @right_x, @top_y, COLOR_BACK, Layer::BOARD)

    draw_line(@left_x, @top_y, COLOR_LINE,
              @left_x, @bottom_y, COLOR_LINE, Layer::BOARD)
    draw_line(@left_x, @bottom_y, COLOR_LINE,
              @right_x, @bottom_y, COLOR_LINE, Layer::BOARD)
    draw_line(@right_x, @bottom_y, COLOR_LINE,
              @right_x, @top_y, COLOR_LINE, Layer::BOARD)
    draw_line(@right_x, @top_y, COLOR_LINE,
              @left_x, @top_y, COLOR_LINE, Layer::BOARD)
  end

  def hover(mouse_x, mouse_y)
    if (mouse_x > @left_x && mouse_x < @right_x) && (mouse_y > @top_y && mouse_y < @bottom_y)
      draw_quad(@left_x, @top_y, COLOR_HOVER,
                @left_x, @bottom_y, COLOR_HOVER,
                @right_x, @bottom_y, COLOR_HOVER,
                @right_x, @top_y, COLOR_HOVER, Layer::BOARD)
    end
  end
end
