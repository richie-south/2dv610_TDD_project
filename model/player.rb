

class Player 

  def initialize(name)
    unless name.length > 0
      raise ArgumentError, 'name cannot be empty'
    end
    @name = name.capitalize
    @moves = []
  end

  def add_move(move)
    @moves << move
  end

  def get_all_moves
    @moves
  end

  def get_name
    @name
  end

end