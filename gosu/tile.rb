require 'gosu'
require_relative 'module/layer'
include Gosu


class Tile
  def initialize(left_x, right_x, top_y, bottom_y, colorBack, colorLine)
    @colorBack = colorBack
    @colorLine = colorLine
    @left_x = left_x
    @right_x = right_x
    @top_y = top_y
    @bottom_y = bottom_y
    @hover_color = Color.argb(0xff_808080)

    draw_quad(left_x, top_y, colorBack,
              left_x, bottom_y, colorBack,
              right_x, bottom_y, colorBack,
              right_x, top_y, colorBack, Layer::BOARD)

    draw_line(left_x, top_y, colorLine,
              left_x, bottom_y, colorLine, Layer::BOARD)
    draw_line(left_x, bottom_y, colorLine,
              right_x, bottom_y, colorLine, Layer::BOARD)
    draw_line(right_x, bottom_y, colorLine,
              right_x, top_y, colorLine, Layer::BOARD)
    draw_line(right_x, top_y, colorLine,
              left_x, top_y, colorLine, Layer::BOARD)
  end

  def hover(mouse_x, mouse_y)
    if (mouse_x > @left_x && mouse_x < @right_x) && (mouse_y > @top_y && mouse_y < @bottom_y)
      draw_quad(@left_x, @top_y, @hover_color,
                @left_x, @bottom_y, @hover_color,
                @right_x, @bottom_y, @hover_color,
                @right_x, @top_y, @hover_color, Layer::BOARD)
    end
  end
end
