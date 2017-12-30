require_relative 'module/affichage'
require_relative 'player'

class Input
  def initialize; end

  def self.action(player)
    if button_down?(KB_W)
      player.move_forward
    end
    if button_down?(KB_S)
      player.move_backward
    end
    if button_down?(KB_A)
      player.turn_left
    end
    if button_down?(KB_D)
      player.turn_right
    end
  end

  def self.pause?
    button_down?(KB_ESCAPE)
  end

end
