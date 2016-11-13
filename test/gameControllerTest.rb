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
    expected = {x: 1, y: 1}
    inputOrder = sequence('inputOrder')
    c.expects(:display_enter_coordinate).in_sequence(inputOrder)
    c.expects(:get_input).in_sequence(inputOrder).returns('x1')
    m.expects(:string_to_position_parser).in_sequence(inputOrder).returns({x:1})
    c.expects(:display_enter_coordinate).in_sequence(inputOrder)
    c.expects(:get_input).in_sequence(inputOrder).returns('y1')
    m.expects(:string_to_position_parser).in_sequence(inputOrder).returns({y:1})
    m.expects(:merge_position_objects).in_sequence(inputOrder).returns(expected)

    gameController = GameController.new(r, m, g, c)
    actual = gameController.get_player_coordinate_inputs 'Jonas'
    assert_equal(expected, actual)
  end

  it 'get player coordinate inputs should run invalid_coordinate' do
      r = mock()
      m = mock()
      g = mock()
      c = mock()
      expected = {x: 1, y: 1}
      inputOrder = sequence('inputOrder')
      c.expects(:display_enter_coordinate).in_sequence(inputOrder)
      c.expects(:get_input).in_sequence(inputOrder).returns('x3')
      m.expects(:string_to_position_parser).in_sequence(inputOrder).raises(ArgumentError, '')
      c.expects(:display_invalid_coordinate).in_sequence(inputOrder)
      c.expects(:display_enter_coordinate).in_sequence(inputOrder)
      c.expects(:get_input).in_sequence(inputOrder).returns('x2')
      m.expects(:string_to_position_parser).in_sequence(inputOrder).returns({x:1})
      c.expects(:display_enter_coordinate).in_sequence(inputOrder)
      c.expects(:get_input).in_sequence(inputOrder).returns('y1')
      m.expects(:string_to_position_parser).in_sequence(inputOrder).returns({y:1})
      m.expects(:merge_position_objects).in_sequence(inputOrder).returns(expected)

      gameController = GameController.new(r, m, g, c)
      actual = gameController.get_player_coordinate_inputs 'Jonas'
      assert_equal(expected, actual)
    end

  it 'get player coordinate inputs should run invalid_coordinate in get_player_coordinate_inputs' do
    r = mock()
    m = mock()
    g = mock()
    c = mock()
    expected = {x: 1, y: 1}
    inputOrder = sequence('inputOrder')
    # expect error
    c.expects(:display_enter_coordinate).in_sequence(inputOrder)
    c.expects(:get_input).in_sequence(inputOrder).returns('x1')
    m.expects(:string_to_position_parser).in_sequence(inputOrder).returns({x:1})
    c.expects(:display_enter_coordinate).in_sequence(inputOrder)
    c.expects(:get_input).in_sequence(inputOrder).returns('x1')
    m.expects(:string_to_position_parser).in_sequence(inputOrder).returns({x:1})
    m.expects(:merge_position_objects).in_sequence(inputOrder).raises(ArgumentError)
    c.expects(:display_invalid_coordinate).in_sequence(inputOrder)
    # working example
    c.expects(:display_enter_coordinate).in_sequence(inputOrder)
    c.expects(:get_input).in_sequence(inputOrder).returns('x1')
    m.expects(:string_to_position_parser).in_sequence(inputOrder).returns({x:1})
    c.expects(:display_enter_coordinate).in_sequence(inputOrder)
    c.expects(:get_input).in_sequence(inputOrder).returns('y1')
    m.expects(:string_to_position_parser).in_sequence(inputOrder).returns({y:1})
    m.expects(:merge_position_objects).in_sequence(inputOrder).returns(expected)

    gameController = GameController.new(r, m, g, c)
    actual = gameController.get_player_coordinate_inputs 'Jonas'
    assert_equal(expected, actual)
  end

  it 'get next player should get index from array' do
    r = mock()
    m = mock()
    g = mock()
    c = mock()
    gameController = GameController.new(r, m, g, c)
    value, index = gameController.get_next_player([1, 2], 0)
    assert_equal value, 1
    assert_equal index, 1
    value, index = gameController.get_next_player([1, 2], 3)
    assert_equal value, 1
    assert_equal index, 1
  end

  it 'is any player winner: should return true if any player is winner' do
    r = mock() 
    m = mock()
    g = mock() 
    c = mock()
    p1 = mock()
    p2 = mock()

    r.expects(:is_player_winner).returns(true)
    p1.expects(:get_all_moves).returns([{x: 0, y: 0}, {x: 0, y: 1}, {x: 0, y: 2}])

    gameController = GameController.new(r, m, g, c)
    actual = gameController.is_any_player_winner([p1, p2])
    assert_equal true, actual
  end

  it 'is any player winner: should return false if no player is winner' do
    r = mock() 
    m = mock()
    g = mock() 
    c = mock()
    p1 = mock()
    p2 = mock()

    r.expects(:is_player_winner).returns(false).at_least_once
    p1.expects(:get_all_moves).returns([])
    p2.expects(:get_all_moves).returns([])

    gameController = GameController.new(r, m, g, c)
    actual = gameController.is_any_player_winner([p1, p2])
    assert_equal false, actual
  end

  it 'get winner player should return player instance' do
    r = mock() 
    m = mock()
    g = mock() 
    c = mock()
    p1 = mock()
    p2 = mock()

    r.expects(:is_player_winner).returns(true).at_least_once
    p1.expects(:get_all_moves)

    gameController = GameController.new(r, m, g, c)
    actual = gameController.get_winner_player([p1, p2])
    assert_equal p1, actual
  end

  it 'get winner player should return false if no player is winner' do
    r = mock() 
    m = mock()
    g = mock() 
    c = mock()
    p1 = mock()
    p2 = mock()

    r.expects(:is_player_winner).returns(false).at_least_once
    p1.expects(:get_all_moves)
    p2.expects(:get_all_moves)

    gameController = GameController.new(r, m, g, c)
    actual = gameController.get_winner_player([p1, p2])
    assert_equal false, actual
  end

end
