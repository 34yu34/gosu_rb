require 'gosu'
require_relative 'tile'
require_relative 'module/dimension'
include Gosu
include Dimension

class Board
  def initialize
    width_tile_y = BOARD_HEIGHT / BOARD_NB_COL
    width_tile_x = BOARD_WIDTH / BOARD_NB_COL
    @tile = Array.new(BOARD_NB_COL) { Array.new(BOARD_NB_COL) { nil } }
    (0...BOARD_NB_COL).each do |i|
      (0...BOARD_NB_COL).each do |j|
        left_x = i * width_tile_x + BOARD_SIDE_SPACE + (i == 0 ? 1 : 0)
        right_x = (i + 1) * width_tile_x + BOARD_SIDE_SPACE
        top_y = j * width_tile_y + + BOARD_TOP_SPACE + (j == 0 ? 1 : 0)
        bottom_y = (j + 1) * width_tile_y + BOARD_TOP_SPACE
        @tile[i][j - 1] = Tile.new(left_x, right_x, top_y, bottom_y)
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
      col.each(&:draw)
    end
  end
end
