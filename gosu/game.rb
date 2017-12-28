require_relative 'background'
require_relative 'board'
class Game
  BOARD_SIZE = 8

  def initialize(width, height, mouse_x, mouse_y)
    @width = width
    @height = height
    @mouse_x = mouse_x
    @mouse_y = mouse_y
    player_space = height / 10
    side_space = width / 10
    board_width = width - 2 * side_space
    board_height = height - 2 * player_space
    @background = Background.new(width,height)
    @board = Board.new(BOARD_SIZE, board_width, board_height, side_space, player_space)
  end

  def hover
    @board.hover(@mouse_x, @mouse_y)
  end
end
