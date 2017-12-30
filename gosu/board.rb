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
        left_x = i * @width_x + start_x + (i == 0 ? 1 : 0)
        right_x = (i + 1) * @width_x + start_x
        top_y = j * @width_y ++ start_y+ (j == 0 ? 1 : 0)
        bottom_y = (j + 1) * @width_y + start_y
        @tile[i][j - 1] = Tile.new(left_x, right_x, top_y, bottom_y, colorBack, colorLine)
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

  def draw
    @tile.each do |col|
      col.each do |tile|
        tile.draw
      end
    end
  end
end
