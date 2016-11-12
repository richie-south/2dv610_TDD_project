require 'rubygems'
gem 'mocha'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/unit'
require 'mocha/mini_test'
require_relative '../controller/gameController'
require_relative '../model/player'

describe 'GameController class' do
  it 'get player name should return instance of player with name' do
    name = 'Jonas'
    r = mock()
    m = mock()
    g = mock()
    c = mock()
    inputOrder = sequence('inputOrder')
    c.expects(:display_enter_player_name).in_sequence(inputOrder)
    c.expects(:get_input).in_sequence(inputOrder).returns(name)

    gameController = GameController.new(r, m, g, c)
    actual = gameController.get_player_name
    assert_instance_of Player, actual
    assert_equal actual.get_name, name
  end

end