# Class PlayHanoi which initializes a new game of Tower of Hanoi
class PlayHanoi

  def initialize disks = 3
    @disks = disks

    # initializing an address hash for each disk.  Key is disk and value is an array of tower and level.
    @towers = {1 => nil, 2 => [], 3 => []}
    @towers[1] = Array.new(@disks) { |i| @disks - i }
  end

  def render
    # Towers and disks
    @disks.times do |reverse_level|
      level_index = @disks - reverse_level - 1
      level_string = ''

      3.times do |tower_minus_one|
        tower = tower_minus_one + 1
        if @towers[tower][level_index].nil?
          level_string += ' ' * (@disks + 2)
        else
          level_string += ' ' + 'o' * @towers[tower][level_index] + ' '
        end
      end

      puts level_string
    end

    # Tower labels
    puts "-" * (@disks + 2) * 3
    labels = ''
    3.times { |i| labels += "#{' ' * (@disks - 1)}#{i + 1}#{' ' * (@disks - 1)}"}
    puts labels
  end

  def quit
    puts "Thank you for playing Tower of Hanoi!  Be sure to rate us in the App Store!"
  end

  def user_won?
    @towers[3] == Array.new(@disks) { |i| @disks - i }
  end

  def valid_move? user_move
    from_tower = user_move[0]
    to_tower = user_move[1]

    if from_tower == to_tower || @towers[from_tower].empty?
      false
    elsif @towers[to_tower].empty?
      true
    elsif @towers[to_tower].last > @towers[from_tower].last
      true
    else
      false
    end
  end

  def move user_move
    # assumes valid input entered (TODO: validate input)

    # What is the move and repeat it back to user
    from_tower = user_move[0]
    to_tower = user_move[1]
    puts "Move disk from tower #{from_tower} to tower #{to_tower}."

    # TODO: Validate that it's a valid move.
    # Perform move
    if valid_move? user_move
      @towers[to_tower] << @towers[from_tower].pop
      render
      if user_won?
        puts "YOU WON!!"
        quit
      else
        next_action
      end
    else
      puts "I'm sorry, that's not a valid move.  Try again."
      next_action
    end
  end

  def next_action
    puts "Enter move > "
    action = gets.chomp

    if action == 'q' || action == 'quit'
      quit
    else
      user_move = action.split(',').map { |tower| tower.to_i }
      move(user_move)
    end
  end

  def play
    puts "************************************"
    puts "***  Welcome to Tower of Hanoi!  ***"
    puts "************************************"
    puts "Instructions:"
    puts "Enter which tower you'd like to move a disk from and then which tower to move that disk to in the format using integers separated by a comma.  For example:\n Enter move > 1,3\nEnter 'q' to quit. \n\nCurrent Board:"

    render
    next_action
  end
end

