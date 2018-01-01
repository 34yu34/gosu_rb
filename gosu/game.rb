require_relative 'background'
require_relative 'module/dimension'
require_relative 'board'
require_relative 'player'
require_relative 'input'

class Game
  def initialize
    @mouse_x = @mouse_y = 0
    @background = Background.new
    @board = Board.new
    @player = Player.new(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2)
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
    @player.update
    !Input.pause?
  end
end
