require_relative 'background'
require_relative 'board'
require_relative 'player'
require_relative 'input'


class Game
  BOARD_SIZE = 8

  def initialize(width, height)
    @width = width
    @height = height
    @mouse_x = @mouse_y = 0
    player_space = height / 10
    side_space = width / 10
    board_width = width - 2 * side_space
    board_height = height - 2 * player_space
    @background = Background.new(width, height)
    @board = Board.new(BOARD_SIZE, board_width, board_height, side_space, player_space)
    @player = Player.new(width / 2, height / 2, Color::GREEN)
  end

  def hover
    @board.hover(@mouse_x, @mouse_y)
  end

  def draw(mouse_x, mouse_y)
    @mouse_x = mouse_x
    @mouse_y = mouse_y
    @background.draw
    @board.draw
    @player.draw
  end

  def play
    Input.action(@player)
    return !Input.pause?
  end

end
