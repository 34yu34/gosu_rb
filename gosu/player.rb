require 'gosu'

include Gosu

class Player

  PLAYER_SIDE_LENGTH = 45

  def initialize(pos_x, pos_y, color)
    @x = pos_x
    @y = pos_y
    @color = color
  end

  def draw
    big_radius = PLAYER_SIDE_LENGTH * (3.0**(1.0/2.0)) / 3.0
    small_radius = PLAYER_SIDE_LENGTH * (3.0**(1.0/2.0)) / 6.0
    ax = @x
    ay = @y - big_radius
    bx = @x + PLAYER_SIDE_LENGTH/2
    by = @y + small_radius
    cx = @x - PLAYER_SIDE_LENGTH/2
    cy = @y + small_radius
    draw_triangle(ax,ay,@color,bx,by,@color,cx,cy,@color, Layer::PLAYER)
  end

  def turn(side)

  end
end
