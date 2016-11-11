require 'rubygems'
gem 'mocha'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/unit'
require 'mocha/mini_test'
require_relative '../model/rules'

describe 'Rules class' do
  it 'is player winner: should return true if player has 3 positions in a row' do
    
    rules = Rules.new
    player = mock()
    player.expects(:get_all_moves).returns([{x: 0, y: 0}, {x: 0, y: 1}, {x: 0, y: 2}])
    refute rules.is_player_winner(player)
  end
end
