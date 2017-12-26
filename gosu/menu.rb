require 'gosu'
require_relative 'button'
include Gosu

class Menu
  def initialize(width, height)
    header = Buton.new('Battle Legend', height / 4, width, 0, 0)
    start = Buton.new('Start', height / 8, width, 0, header.next_pos_y)
    quit = Buton.new('Quit', height / 8, width, 0, start.next_pos_y)
    @button = [header, start, quit]
  end

  def hover(mouse_x, mouse_y)
    @button.each do |button|
      button.hover(mouse_x, mouse_y)
    end
  end
end
