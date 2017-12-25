class Mouse
  def initialize(mouse_x, mouse_y)
    draw_triangle(mouse_x, mouse_y, Color::WHITE,
                  mouse_x + 15, mouse_y, Color::RED,
                  mouse_x, mouse_y + 15, Color::GREEN, 10)
  end
end
