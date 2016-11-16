require 'rubygems'
gem 'mocha'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/unit'
require 'mocha/mini_test'
require_relative '../model/grid'

describe 'Grid class' do

  it 'should return array size equal to input size' do
    grid = Grid.new 3
    assert_equal 3, grid.get_grid.length 
  end

  it 'should return array with arrays in every position equal to the size of initial array' do
    size = 10
    grid = Grid.new size
    
    
    size.times do |i|
      assert_equal size, grid.get_grid[i].length
    end
    
  end
end