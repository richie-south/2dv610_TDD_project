
class Move

  def initialize
    @input_directions = [:x, :y]
  end

  def get_position_object(x, y)

  end

  def string_to_position_parser(string)
    parts = string.split('')
    direction = parts[0].to_sym
    until @input_directions.include? direction 
      raise ArgumentError, 'Unknown direction'
    end
     
  end
  
end