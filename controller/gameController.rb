require_relative '../model/player'

class GameController

  def initialize(rules, move, gameBordView, controllsView)
    @rules = rules
    @move = move
    @gameBordView = gameBordView
    @controllsView = controllsView
  end

  def run 
    playerOne = get_player_name
    @controllsView.display_player_created playerOne.get_name
    playerTwo = get_player_name
    @controllsView.display_player_created playerTwo.get_name
  end

  def get_player_coordinate_inputs(name)
    @controllsView.display_enter_first_coordinate name
    @controllsView.get_input
    @move.string_to_position_parser
    @controllsView.display_enter_second_coordinate name
    @controllsView.get_input
    @move.string_to_position_parser
    @move.merge_position_objects
    {x: 1, y: 1}
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