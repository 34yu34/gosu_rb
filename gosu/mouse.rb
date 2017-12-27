require_relative 'layer'

class Mouse
  def initialize(mouse_x, mouse_y)
  @mouse_size = 15
    draw_triangle(mouse_x, mouse_y, Color::WHITE,
                  mouse_x + @mouse_size, mouse_y, Color::RED,
                  mouse_x, mouse_y + @mouse_size, Color::GREEN, Layer.mouse)
  end
end
