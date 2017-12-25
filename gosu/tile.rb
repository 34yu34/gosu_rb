require 'gosu'
include Gosu


class Tile
  def initialize(x1,x2,y1,y2,color)
    @color = color
    @x1 = x1
    @x2 = x2
    @y1 = y1
    @y2 = y2
    draw_quad(x1, y1, color, x1, y2, color, x2, y2, color, x2, y1, color,0)
  end

  def hover(mouse_x,mouse_y)
    if (mouse_x > @x1 && mouse_x < @x2) && (mouse_y > @y1 && mouse_y < @y2)
      color = Color.argb(0xff_808080)
      draw_quad(@x1, @y1, color, @x1, @y2, color, @x2, @y2, color, @x2, @y1, color,1)
    else
      color = Color.argb(0x00_000000)
      draw_quad(@x1, @y1, color, @x1, @y2, color, @x2, @y2, color, @x2, @y1, color,1)
    end
  end
end
