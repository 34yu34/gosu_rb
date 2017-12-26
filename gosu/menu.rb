require 'gosu'
require_relative 'button'
include Gosu

class Menu
  def initialize(width, height)
    header = Buton.new('Battle Legend', height / 4, width, 0, 0)
    start = Image.from_text('Start', height / 4, width, 0, 0)
    quit = Image.from_text('Quit', height / 4, width: width, align: :center)
    start.draw(0,height/4,0)
    quit.draw(0,2*height/4,0)
  end

  def next_button()
  end

end
