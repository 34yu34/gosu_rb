require 'gosu'
require_relative 'module/layer'
include Gosu
class Ennemi
  def initialize(pos_x, pos_y, size)
    @x = pos_x
    @y = pos_y
    @size = 0
    @max_size = size
    @color = Color::BLACK
    find_corner_pos
  end

  def update
    if @size < @max_size
      @size += 1
    end
  end

  def find_corner_pos
    @top_x = find_x_pos(90)
    @top_y = find_y_pos(90)
    @top_right_x = find_x_pos(18)
    @top_right_y = find_y_pos(18)
    @top_left_x = find_x_pos(162)
    @top_left_y = find_y_pos(162)
    @bottom_left_y = find_y_pos(234)
    @bottom_left_x = find_x_pos(234)
    @bottom_right_x = find_x_pos(306)
    @bottom_right_y = find_y_pos(306)
  end

  def draw
    find_corner_pos

    draw_triangle(@top_x, @top_y, @color,
                  @top_right_x, @top_right_y, @color,
                  @x, @y, @color, Layer::PLAYER)

    draw_triangle(@top_x, @top_y, @color,
                  @top_left_x, @top_left_y, @color,
                  @x, @y, @color, Layer::PLAYER)

    draw_triangle(@top_left_x, @top_left_y, @color,
                  @bottom_left_x, @bottom_left_y, @color,
                  @x, @y, @color, Layer::PLAYER)

    draw_triangle(@top_right_x, @top_right_y, @color,
                  @bottom_right_x, @bottom_right_y, @color,
                  @x, @y, @color, Layer::PLAYER)

    draw_triangle(@bottom_left_x, @bottom_left_y, @color,
                  @bottom_right_x, @bottom_right_y, @color,
                  @x, @y, @color, Layer::PLAYER)
  end

  def find_x_pos(angle)
    @x + @size * Math.cos(radian(angle + 180))
  end

  def find_y_pos(angle)
    @y + @size * Math.sin(radian(angle + 180))
  end

  def radian(angle)
    (angle * 2 * Math::PI) / 360
  end
end
