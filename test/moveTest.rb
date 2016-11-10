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

  
end
