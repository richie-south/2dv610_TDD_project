

class Player 

  def initialize(name)
    unless name.length > 0
      raise ArgumentError, 'name cannot be empty'
    end
    @name = name.capitalize
  end

  def add_move

  end

  def get_all_moves
    
  end

  def get_name
    @name
  end

end