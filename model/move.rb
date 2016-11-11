
class Move

  def initialize
    @input_directions = [:x, :y]
    
  end

  def merge_position_objects(p1, p2)
    position = p1.merge p2
    unless position.include?(:y) && position.include?(:x)
      raise ArgumentError, 'Position must include both directions'
    end
    position
  end

  def string_to_position_parser(string)
    position = { }
    parts = string.split ''
    direction = parts[0].to_sym
    steps = parts[1].to_i

    unless @input_directions.include? direction 
      raise ArgumentError, 'Unknown direction'
    end
    
    if steps >= 3 || steps < 0
      raise ArgumentError, 'Invalid position'
    end
    position[direction] = steps
    position
  end

  def is_position_used(positions, to_add)
    positions.include?({x: to_add[:x], y: to_add[:y]})
  end
  
end