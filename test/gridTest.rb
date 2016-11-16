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
end