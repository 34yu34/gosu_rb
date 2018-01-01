require_relative 'board'
require_relative 'module/layer'
require_relative 'module/dimension'
class Background
  attr_reader :COLOR

  def initialize()
    @COLOR = Color::CYAN
  end

  def draw
    draw_quad(0, 0, @COLOR,
              WINDOW_WIDTH, 0, @COLOR,
              WINDOW_WIDTH, WINDOW_HEIGHT, @COLOR,
              0, WINDOW_HEIGHT, @COLOR, Layer::BACKGROUND)
  end
end
