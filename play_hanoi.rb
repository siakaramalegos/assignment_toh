# Class PlayHanoi which initializes a new game of Tower of Hanoi
class PlayHanoi

  def initialize disks = 3
    @disks = disks

    # initializing an address hash for each disk.  Key is disk and value is an array of tower and level.
    @locations = Hash.new
    @disks.times do |i|
      @locations[i + 1] = [1, @disks - i]
    end
  end

  def render
    # TODO:  make graphical version of this
    puts @locations
  end

  def quit
    puts "Thank you for playing Tower of Hanoi!  Be sure to rate us in the App Store!"
  end

  def move user_move
    # assumes valid move entered (TODO: validate input)
    puts user_move.to_s
    render
    next_action
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
    puts "Enter where you'd like to move from and to in the format using integers separated by a comma.  For example:\n Enter move > 1,3\nEnter 'q' to quit. \n\nCurrent Board:"

    render
    next_action
  end
end

