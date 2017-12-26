
module Affichage
  MENU = 1
  GAME = 2
end

class Input
  def initialize; end

  def self.menu
    if button_down?(KB_RETURN)
      return Affichage::GAME
    end
    Affichage::MENU
  end

  def self.game
    if button_down?(KB_ESCAPE)
      return Affichage::MENU
    end
    Affichage::GAME
  end
end
