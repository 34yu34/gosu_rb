require 'gosu'
require_relative 'module/layer'
include Gosu


class Tile
  def initialize(x1, x2, y1, y2, colorBack, colorLine)
    @colorBack = colorBack
    @colorLine = colorLine
    @x1 = x1
    @x2 = x2
    @y1 = y1
    @y2 = y2
    @hover_color = Color.argb(0xff_808080)
    
    draw_quad(x1, y1, colorBack,
              x1, y2, colorBack,
              x2, y2, colorBack,
              x2, y1, colorBack, Layer::BOARD)

    draw_line(x1, y1, colorLine,
              x1, y2, colorLine, Layer::BOARD)
    draw_line(x1, y2, colorLine,
              x2, y2, colorLine, Layer::BOARD)
    draw_line(x2, y2, colorLine,
              x2, y1, colorLine, Layer::BOARD)
    draw_line(x2, y1, colorLine,
              x1, y1, colorLine, Layer::BOARD)
  end

  def hover(mouse_x, mouse_y)
    if (mouse_x > @x1 && mouse_x < @x2) && (mouse_y > @y1 && mouse_y < @y2)
      draw_quad(@x1, @y1, @hover_color,
                @x1, @y2, @hover_color,
                @x2, @y2, @hover_color,
                @x2, @y1, @hover_color, Layer::BOARD)
    end
  end
end
