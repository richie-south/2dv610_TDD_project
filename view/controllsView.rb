
class ControllsView

  def initialize
    clear_screen
    display_start_header
  end

  def clear_screen
    system "clear"
  end

  def display_line
    puts '==================================='
  end

  def display_start_header
    display_line
    puts '=========three=in=a=row============'
    display_line
  end

  def display_enter_player_name
    print '-> Enter player name: '
  end

  def display_invalid_name
    puts '-> Invalid name!'
  end

  def display_player_created(name)
    puts "-> Player #{name} created"
  end

  def get_input
    gets.chomp
  end

  def display_invalid_coordinate
    puts '-> Invalid coordinate! Try again:'
  end

  def display_position_is_used
    puts '-> Position is already used!'
  end

  def display_enter_coordinate(name)
    print "-> Player #{name} Enter coordinate: "
  end

  def display_winner(name)
    display_line
    puts "-> Congratulations #{name} you won!"
    display_line
  end

end