require 'rubygems'
require 'gosu'
require_relative 'board'
require_relative 'menu'
require_relative 'mouse'
require_relative 'input'

include Gosu

class Game < Window
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
      menu = Menu.new(WIDTH, HEIGHT)
      menu.hover(mouse_x,mouse_y)
      @affichage = Input.menu
    when Affichage::GAME
      b = Board.new(8, WIDTH, HEIGHT)
      b.hover(mouse_x, mouse_y)
      @affichage = Input.game
    end
  end
end
