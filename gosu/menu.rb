require 'gosu'
require_relative 'module/affichage'
require_relative 'static_button'
include Gosu

class Menu
  def initialize(width, height, mouse_x, mouse_y)
    @line = []
    @mouse_x = mouse_x
    @mouse_y = mouse_y
    @line << Static_Text.new('Battle Legend', height / 4, width, 0, 0)
    @line << Static_Button.new('Start', height / 8, width / 4, center(width, width / 4), @line.last.next_pos_y, Affichage::GAME)
    @line << Static_Button.new('Quit', height / 8, width / 4, center(width, width / 4), @line.last.next_pos_y, Affichage::QUIT)
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
