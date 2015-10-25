# Class PlayHanoi which initializes a new game of Tower of Hanoi
class PlayHanoi

  def initialize disks = 3
    @disks = disks
  end

  def render
    puts "TODO board stuff"
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

