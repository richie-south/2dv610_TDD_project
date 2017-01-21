
class GameBordView

  def initialize

  end

  def display_gamebord(moves1, moves2)
    grid = moves_to_grid(get_grid, moves1, ' X ')
    grid_string = draw_grid moves_to_grid(grid, moves2, ' O ')
    puts grid_string
    grid_string
  end

  private

  def draw_grid(grid)
    result = "----gamebord----\n"
    nr = 0
    result += "y x→ 0   1   2\n"
    result += "↓  -------------\n"
    remove_false(grid).each do |row|
      result += "#{nr}  "
      row.each do |colum|
        result += "|#{colum}"
      end
      result += "|\n"
      result += "   -------------\n"
      nr += 1
    end

    result
  end

  def get_grid
    grid = [ 
      [ false, false, false ], 
      [ false, false, false ], 
      [ false, false, false ] ]
  end

  def remove_false(grid)
    grid.map do |row|
      row.map do |colum|
        !colum ? '   ' : colum
      end
    end
  end

  def moves_to_grid(grid, moves, mark)
    moves.each do |move|
      grid[move[:y]][move[:x]] = mark;
    end
    grid
  end
end