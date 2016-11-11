

class Rules
  def initialize
    
  end

  # is game over, p1, p2 
  def is_player_winner(player)
    moves = player.get_all_moves
    grid = map_to_grid moves
    is_winner grid
  end

  private

  def is_winner(grid)
    if check_if_three_in_row_x(grid)
      true
    elsif check_if_three_in_row_y(grid)
      true
    elsif check_if_three_in_diagonal(grid)
      true
    else
      false
    end
  end

  def check_if_three_in_diagonal(grid)
     
    foo = lambda do |positions|
      heap = []
      i = 0
      grid.each do |row|
        if row[positions[i]]
          heap << row[positions[i]]
        end
        i += 1
      end
      heap
    end

    if (foo.call([0, 1, 2]).length >= grid.length)
      return true
    elsif (foo.call([2, 1, 0]).length >= grid.length)
      return true
    end
    false 
  end

  def check_if_three_in_row_x(grid, row = 0)
    if row > grid.length-1
      return false
    end
    heap = []
    grid[row].each do | column |
      if column
        heap << column
      end
    end

    (heap.length >= grid.length) ? true : check_if_three_in_row_x(grid, row += 1) 
  end

  def check_if_three_in_row_y(grid, column = 0)
    if column > grid.length-1
      return false
    end

    heap = []
    grid.each do | row | # ^
      if row[column] # >
        heap << row[column]
      end
    end

    (heap.length >= grid.length) ? true : check_if_three_in_row_y(grid, column += 1)
  end 

  def map_to_grid(moves)
    grid = [ 
      [ false, false, false ], 
      [ false, false, false ], 
      [ false, false, false ] ]

    moves.each do |move|
      grid[move[:y]][move[:x]] = true;
    end
    
    grid
  end


end