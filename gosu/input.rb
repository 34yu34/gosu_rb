require_relative 'module/affichage'
require_relative 'player'

class Input
  @@space_press = false
  def initialize; end

  def self.action(player)
    if button_down?(KB_W) || button_down?(KB_UP)
      player.move_forward
    end
    if button_down?(KB_S) || button_down?(KB_DOWN)
      player.move_backward
    end
    if button_down?(KB_A) || button_down?(KB_LEFT)
      player.turn_left
    end
    if button_down?(KB_D) || button_down?(KB_RIGHT)
      player.turn_right
    end
    if button_down?(KB_SPACE)
      if !@@space_press
        player.shoot
        @@space_press = true
      end
    else
      @@space_press = false
    end
  end

  def self.pause?
    button_down?(KB_ESCAPE)
  end

end
