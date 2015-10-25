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

  def play
    puts "************************************"
    puts "***  Welcome to Tower of Hanoi!  ***"
    puts "************************************"
    puts "Instructions:"
    puts "Enter where you'd like to move from and to in the format [1,3]. Enter 'q' to quit. Current Board:"

    render
  end
end

