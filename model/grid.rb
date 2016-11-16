
class Grid 

  def initialize(size)
    @size = size
  end

  def get_grid
    grid = []
    @size.times do |row|
      grid[row] = []
      @size.times do |column|
        grid[row][column] = false
      end
    end
    grid
  end
end