require 'rubygems'
require 'gosu'
require_relative 'board'
require_relative 'menu'
require_relative 'mouse'
require_relative 'input'

include Gosu

module Affichage
  MENU = 1
  GAME = 2
  QUIT = 3
end


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
      menu = Menu.new(WIDTH, HEIGHT, mouse_x, mouse_y)
      @affichage = menu.next_page(@affichage)
    when Affichage::GAME
      b = Board.new(8, WIDTH, HEIGHT)
      b.hover(mouse_x, mouse_y)
      @affichage = Input.game
    when Affichage::QUIT
      close
    end
  end
end
