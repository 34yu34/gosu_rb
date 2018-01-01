require 'gosu'
require_relative 'module/affichage'
require_relative 'static_button'
include Gosu
include Dimension
class Menu
  def initialize(mouse_x, mouse_y)
    @line = []
    @mouse_x = mouse_x
    @mouse_y = mouse_y
    @line << Static_Text.new('Battle Legend', WINDOW_HEIGHT / 4, WINDOW_WIDTH, 0, 0)
    @line << Static_Button.new('Start', WINDOW_HEIGHT / 8, WINDOW_WIDTH / 4, center(WINDOW_WIDTH, WINDOW_WIDTH / 4), @line.last.next_pos_y, Affichage::GAME)
    @line << Static_Button.new('Quit', WINDOW_HEIGHT / 8, WINDOW_WIDTH / 4, center(WINDOW_WIDTH, WINDOW_WIDTH / 4), @line.last.next_pos_y, Affichage::QUIT)
  end

  def next_page(current_page)
    @line.each do |line|
      if line.instance_of? Static_Button
        line.hover(@mouse_x, @mouse_y)
        return line.link if line.click?(@mouse_x, @mouse_y)
      end
    end
    current_page
  end

  def center(width, button_width)
    (width - button_width) / 2
  end
end
