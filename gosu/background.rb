require 'rubygems'
require 'gosu'
require_relative 'board'
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
    draw_triangle(mouse_x,mouse_y,Color::WHITE,mouse_x+15,mouse_y,Color::RED,mouse_x,mouse_y+15,Color::GREEN,10)
  end
end
