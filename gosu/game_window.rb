require 'rubygems'
require 'gosu'
require_relative 'game'
require_relative 'menu'
require_relative 'mouse'
require_relative 'input'
require_relative 'module/affichage'
require_relative 'module/dimension'

include Dimension
include Gosu

class Game_Window < Window
  def initialize
    #var
    super WINDOW_WIDTH, WINDOW_HEIGHT
    self.caption = 'Battle Legend'
    @affichage = Affichage::MENU
    @game = Game.new
  end

  def update
    case @affichage
    when Affichage::GAME
      if !@game.play
        @affichage = Affichage::MENU
      end
    when Affichage::MENU
    when Affichage::QUIT
      close
    end
  end

  def draw
    mouse = Mouse.new(mouse_x, mouse_y)
    case @affichage
    when Affichage::MENU
      menu = Menu.new(mouse_x, mouse_y)
      @affichage = menu.next_page(@affichage)
    when Affichage::GAME
      @game.draw(mouse_x, mouse_y)
    end
  end
end
