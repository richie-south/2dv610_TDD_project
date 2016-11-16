
class Grid 

  def initialize(size)
    @size = size
  end

  def get_grid
    grid = []
    @size.times do |row|
      grid[row] = row
    end

    grid
  end
end