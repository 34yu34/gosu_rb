require 'rubygems'
require 'gosu'
require_relative 'board'
require_relative 'mouse'
include Gosu

class Background < Window
  WIDTH = 1280
  HEIGHT = 720

  def initialize
    super WIDTH, HEIGHT
    self.caption = 'Battle Legend'
  end

  def draw
    b = Board.new(8, WIDTH, HEIGHT)
    b.hover(mouse_x, mouse_y)
    Mouse.new(mouse_x, mouse_y)
  end
end
