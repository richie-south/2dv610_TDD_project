require 'rubygems'
gem 'mocha'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/unit'
require 'mocha/mini_test'
require_relative '../model/move'

describe 'Move class' do

  it 'string to position parser should throw argumentError on faulty string' do
    assert_raises ArgumentError do
      move = Move.new()
      move.string_to_position_parser('b1')
    end
  end

  it 'string to position parser should throw ArgumentError on to high number' do
    assert_raises ArgumentError do
      move = Move.new
      move.string_to_position_parser('x3')
    end
  end

  it 'string to position parser should return hash of position' do
    move = Move.new
    position = move.string_to_position_parser('y2')
    assert_equal position[:y], 2
  end

  it 'is position used shuld return true if position is used' do
    move = Move.new
    positions = [{x: 1, y: 1}, {x: 2, y: 1}]
    refute move.is_position_used(positions, {x:3, y: 3})
    assert_equal move.is_position_used(positions, {x:2, y: 1}), true 
  end
  
end
