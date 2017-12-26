require 'gosu'
require_relative 'button'
include Gosu

class Menu
  def initialize(width, height, mouse_x, mouse_y)
    @button = []
    @mouse_x = mouse_x
    @mouse_y = mouse_y
    @button << Buton.new('Battle Legend', height / 4, width, 0, 0, Affichage::MENU)
    @button << Buton.new('Start', height / 8, width / 4, center(width, width / 4), @button.last.next_pos_y, Affichage::GAME)
    @button << Buton.new('Quit', height / 8, width / 4, center(width, width / 4), @button.last.next_pos_y, Affichage::QUIT)
  end

  def next_page(current_page)
    @button.each do |button|
      button.hover(@mouse_x, @mouse_y)
      return button.link if button.click?(@mouse_x, @mouse_y)
    end
    current_page
  end

  def center(width, button_width)
    (width - button_width) / 2
  end
end
