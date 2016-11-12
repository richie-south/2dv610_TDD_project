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

  it 'get player name should run display_invalid_name' do
    name = ''
    r = mock()
    m = mock()
    g = mock()
    c = mock()
    inputOrder = sequence('inputOrder')
    c.expects(:display_enter_player_name).in_sequence(inputOrder)
    c.expects(:get_input).in_sequence(inputOrder).returns(name)
    c.expects(:display_invalid_name).in_sequence(inputOrder)
    c.expects(:display_enter_player_name).in_sequence(inputOrder)
    c.expects(:get_input).in_sequence(inputOrder).returns('jonas')
    
    gameController = GameController.new(r, m, g, c)
    actual = gameController.get_player_name
  end

  it 'get player coordinate inputs should return position object' do
    r = mock()
    m = mock()
    g = mock()
    c = mock()
    inputOrder = sequence('inputOrder')
    c.expects(:display_enter_first_coordinate).in_sequence(inputOrder)
    c.expects(:get_input).in_sequence(inputOrder).returns('x1')
    c.expects(:display_enter_second_coordinate).in_sequence(inputOrder)
    c.expects(:get_input).in_sequence(inputOrder).returns('y1')

    gameController = GameController.new(r, m, g, c)
    actual = gameController.get_player_coordinate_inputs 'Jonas'
    assert_equal({x: 1, y: 1}, actual)

  end

end