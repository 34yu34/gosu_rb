require_relative 'module/layer'

class Magic

  def initialize(pos_x, pos_y, angle)
    #const
    @SIZE = 10
    @SPEED = 15
    @COLOR = Color::BLUE
    #var
    @pos_x = pos_x
    @pos_y = pos_y
    @angle = angle
    find_corner_pos
  end

  def draw
    find_corner_pos
    draw_quad(@right_x, @top_y, COLOR,
              @right_x, @bottom_y, COLOR,
              @left_x, @bottom_y, COLOR,
              @left_x, @top_y, COLOR, Layer::PLAYER)
  end

  def find_corner_pos
    @right_x = @pos_x + SIZE / 2
    @left_x = @pos_x - SIZE / 2
    @top_y = @pos_y - SIZE / 2
    @bottom_y = @pos_y + SIZE / 2
  end

  def update
    rad = radian
    @pos_x += SPEED * Math.cos(rad)
    @pos_y += SPEED * Math.sin(rad)
  end

  def radian
    @angle * Math::PI / 180.0 + Math::PI / 2
  end
end
