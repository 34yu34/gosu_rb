require 'gosu'
require_relative 'magic'
require_relative 'module/layer'
require_relative 'module/dimension'
require_relative 'board'
include Gosu

class Player
  attr_reader :PLAYER_LENGHT, :ANGLE_SPEED, :SPEED, :COLOR
  def initialize(pos_x, pos_y)
    #const
    @PLAYER_LENGHT = 45.0
    @ANGLE_SPEED = 6.0
    @SPEED = 5.0
    @COLOR = Color::GREEN
    #var
    @x = pos_x
    @y = pos_y
    @angle = 180
    @magic = []
    find_corner_pos
  end

  def draw
    find_corner_pos
    draw_triangle(@top_x, @top_y, @COLOR,
                  @right_x, @right_y, @COLOR,
                  @left_x, @left_y, @COLOR, Layer::PLAYER)
    @magic.each do |magic|
      if !magic.outside?
        magic.draw
      else
        @magic.delete(magic)
      end
    end
  end

  def find_corner_pos
    big_radius = @PLAYER_LENGHT * (3.0**(1.0 / 2.0)) / 3.0
    rad = radian
    @top_x = big_radius * Math.cos(rad) + @x
    @top_y = big_radius * Math.sin(rad) + @y
    rad += 2.0 * Math::PI / 3.0
    @right_x = big_radius * Math.cos(rad) + @x
    @right_y = big_radius * Math.sin(rad) + @y
    rad += 2.0 * Math::PI / 3.0
    @left_x = big_radius * Math.cos(rad) + @x
    @left_y = big_radius * Math.sin(rad) + @y
  end

  def turn_right
    @angle += @ANGLE_SPEED
    @angle %= 360
  end

  def turn_left
    @angle -= @ANGLE_SPEED
    @angle %= 360
  end

  def move_forward
    rad = radian
    @x += @SPEED * Math.cos(rad) - BOARD_SIDE_SPACE
    @y += @SPEED * Math.sin(rad) - BOARD_TOP_SPACE
    @x = (@x % BOARD_WIDTH) + BOARD_SIDE_SPACE
    @y = (@y % BOARD_HEIGHT) + BOARD_TOP_SPACE
  end

  def move_backward
    rad = radian
    @x -= @SPEED * Math.cos(rad) + BOARD_SIDE_SPACE
    @y -= @SPEED * Math.sin(rad) + BOARD_TOP_SPACE
    @x = (@x % BOARD_WIDTH) + BOARD_SIDE_SPACE
    @y = (@y % BOARD_HEIGHT) + BOARD_TOP_SPACE
  end

  def radian
    @angle * Math::PI / 180.0 + Math::PI / 2
  end

  def update
    @magic.each{|magic| magic.update}
  end

  def shoot
    @magic << Magic.new(@top_x, @top_y, @angle)
  end
end
