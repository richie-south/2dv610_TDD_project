
class Move

  def initialize
    @input_directions = [:x, :y]
    
  end

  def get_position_object

  end

  def string_to_position_parser(string)
    
    parts = string.split ''
    direction = parts[0].to_sym
    steps = parts[1].to_i

    until @input_directions.include? direction 
      raise ArgumentError, 'Unknown direction'
    end
    
    if steps >= 3 || steps < 0
      raise ArgumentError, 'Invalid position'
    end
    
  end
  
end