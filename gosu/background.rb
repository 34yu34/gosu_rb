require_relative 'board'
require_relative 'module/layer'
class Background

  def initialize(width, height)
    @color = Color::CYAN
    @width = width
    @height = height
  end

  def draw()
    draw_quad(0, 0, @color,
              @width, 0, @color,
              @width, @height, @color,
              0, @height, @color, Layer::BACKGROUND)
  end
end
