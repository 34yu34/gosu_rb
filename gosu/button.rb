require 'gosu'
include Gosu

class Buton
  def initialize(text, height, width, pos_x, pos_y)
    @image = Image.from_text(text, height, width: width, align: :center)
    @image.draw(pos_x, pos_y, 0)
    @x1 = pos_x
    @x2 = pos_x + width
    @y1 = pos_y
    @y2 = pos_y + height
  end

  def next_pos_x
    x2
  end

  def next_pos_y
    y2
  end
end
