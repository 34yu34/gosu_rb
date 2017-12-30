require 'gosu'

include Gosu

class Player
  PLAYER_SIDE_LENGTH = 45.0
  ANGLE_SPEED = 6.0
  SPEED = 5.0

  def initialize(pos_x, pos_y, color)
    @x = pos_x
    @y = pos_y
    @angle = 0
    @color = color
    find_corner_pos
  end

  def draw
    find_corner_pos
    draw_triangle(@top_x, @top_y, @color,
                  @right_x, @right_y, @color,
                  @left_x, @left_y, @color, Layer::PLAYER)
  end

  def find_corner_pos
    big_radius = PLAYER_SIDE_LENGTH * (3.0**(1.0 / 2.0)) / 3.0
    rad = radian
    @top_x = big_radius * Math.cos(rad) + @x
    @top_y = big_radius * Math.sin(rad) + @y
    rad += 2.0 * Math::PI / 3.0
    @right_x = big_radius * Math.cos(rad) + @x
    @right_y = big_radius * Math.sin(rad) + @y
    rad += 2.0 * Math::PI / 3.0
    @left_x = big_radius * Math.cos(rad) + @x
    @left_y = big_radius * Math.sin(rad) + @y
  end

  def turn_right
    @angle -= ANGLE_SPEED
    @angle %= 360
  end

  def turn_left
    @angle += ANGLE_SPEED
    @angle %= 360
  end

  def move_forward
    rad = radian
    @x += SPEED * Math.cos(rad)
    @y += SPEED * Math.sin(rad)
  end

  def move_backward
    rad = radian
    @x -= SPEED * Math.cos(rad)
    @y -= SPEED * Math.sin(rad)
  end

  def radian
    @angle * Math::PI / 180.0 + Math::PI / 2
  end
end
