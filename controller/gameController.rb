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
    coordinatePartOne = get_coordinate_input name
    coordinatePartTwo = get_coordinate_input name 
    begin
      @move.merge_position_objects coordinatePartOne, coordinatePartTwo
    rescue
      @controllsView.invalid_coordinate
      @controllsView.display_invalid_coordinate
      get_player_coordinate_inputs name
    end
  end

  def get_coordinate_input(name)
    @controllsView.display_enter_coordinate name
    begin
      @move.string_to_position_parser @controllsView.get_input
    rescue
      @controllsView.invalid_coordinate
      @controllsView.display_invalid_coordinate
      get_coordinate_input name
    end
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