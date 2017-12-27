require_relative 'board'
require_relative 'module/layer'
class Background

  def initialize(width, height, mouse_x, mouse_y)
    @player_space = height/10
    @side_space = width/10
    @color = Color::CYAN
    @mouse_x = mouse_x
    @mouse_y = mouse_y

    draw_quad(0, 0, @color,
              width, 0, @color,
              width, height, @color,
              0, height, @color, Layer::BACKGROUND)

    @board = Board.new(8, width-2*@side_space, height-2*@player_space, @side_space, @player_space)
  end

  def hover
    @board.hover(@mouse_x, @mouse_y)
  end
end
