require 'gosu'
require_relative 'tile'
include Gosu

class Board
  def initialize(nb_col, width, height, start_x, start_y)
    colorLine = Color::RED
    colorBack = Color::WHITE
    @width_x = width / nb_col
    @width_y = height / nb_col
    @tile = Array.new(nb_col) { Array.new(nb_col) { nil } }
    (0...nb_col).each do |i|
      (0...nb_col).each do |j|
        x1 = i * @width_x + start_x + (i == 0 ? 1 : 0)
        x2 = (i + 1) * @width_x + start_x
        y1 = j * @width_y ++ start_y+ (j == 0 ? 1 : 0)
        y2 = (j + 1) * @width_y + start_y
        @tile[i][j - 1] = Tile.new(x1, x2, y1, y2, colorBack, colorLine)
      end
    end
  end

  def hover(mouse_x, mouse_y)
    @tile.each do |col|
      col.each do |tile|
        tile.hover(mouse_x, mouse_y)
      end
    end
  end
end
