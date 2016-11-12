require_relative '../model/player'

class GameController

  def initialize(rules, move, gameBordView, controllsView)
    @rules = rules
    @move = move
    @gameBordView = gameBordView
    @controllsView = controllsView  
  end

  def get_player_name
    @controllsView.display_enter_player_name
    
    Player.new(@controllsView.get_input)
  end

end