require 'rubygems'
require 'gosu'
require_relative 'game'
require_relative 'menu'
require_relative 'mouse'
require_relative 'input'
require_relative 'module/affichage'

include Gosu

class Game_Window < Window
  WIDTH = 1280
  HEIGHT = 720

  def initialize
    super WIDTH, HEIGHT
    self.caption = 'Battle Legend'
    @affichage = Affichage::MENU
  end

  def draw
    mouse = Mouse.new(mouse_x, mouse_y)
    case @affichage
    when Affichage::MENU
      menu = Menu.new(WIDTH, HEIGHT, mouse_x, mouse_y)
      @affichage = menu.next_page(@affichage)
    when Affichage::GAME
      game = Game.new(WIDTH, HEIGHT, mouse_x, mouse_y)
      @affichage = Input.game
    when Affichage::QUIT
      close
    end
  end
end
