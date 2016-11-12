require_relative '../model/player'

class GameController

  def initialize(rules, move, gameBordView, controllsView)
    @rules = rules
    @move = move
    @gameBordView = gameBordView
    @controllsView = controllsView

    
  end

  def get_name_inputs
    @gameBordView.display_enter_player_names
    
  end

end