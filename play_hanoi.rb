# Class PlayHanoi which initializes a new game of Tower of Hanoi
class PlayHanoi

  def initialize disks = 3
    @disks = disks

    # initializing an address hash for each disk.  Key is disk and value is an array of tower and level.
    @towers = Hash.new
    @disks.times do |i|
      @towers[i + 1] = []
      @towers[1] << @disks - i
    end
  end

  def render
    # TODO:  make graphical version of this
    puts @towers
  end

  def quit
    puts "Thank you for playing Tower of Hanoi!  Be sure to rate us in the App Store!"
  end

  def move user_move
    # assumes valid input entered (TODO: validate input)

    # What is the move and repeat it back to user
    from_tower = user_move[0]
    to_tower = user_move[1]
    puts "Move disk from tower #{from_tower} to tower #{to_tower}"

    # Validate that it's a valid move and perform move

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
    puts "Enter which tower you'd like to move a disk from and then which tower to move that disk to in the format using integers separated by a comma.  For example:\n Enter move > 1,3\nEnter 'q' to quit. \n\nCurrent Board:"

    render
    next_action
  end
end

