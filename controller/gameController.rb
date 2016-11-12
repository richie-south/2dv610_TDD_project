require_relative '../model/player'

class GameController

  def initialize(rules, move, gameBordView, controllsView)
    @rules = rules
    @move = move
    @gameBordView = gameBordView
    @controllsView = controllsView
  end


  def get_player_coordinate_inputs(name)
    @controllsView.display_enter_first_coordinate
    @controllsView.get_input
    @controllsView.display_enter_second_coordinate
    @controllsView.get_input
    {x:1, y:1}
  end

  def get_player_name
    @controllsView.display_enter_player_name

    begin 
      Player.new @controllsView.get_input
    rescue
      @controllsView.display_invalid_name
      get_player_name
    end
  end

end