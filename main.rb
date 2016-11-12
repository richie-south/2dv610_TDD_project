require_relative './model/rules'
require_relative './model/move'
require_relative './view/gameBordView'
require_relative './view/controllsView'
require_relative './controller/gameController'

gameController = GameController.new(
  Rules.new, 
  Move.new, 
  GameBordView.new,
  ControllsView.new)

gameController.run