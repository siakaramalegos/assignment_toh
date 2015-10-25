# Class PlayHanoi which initializes a new game of Tower of Hanoi
class PlayHanoi

  def initialize towers = 3
    @towers = towers
  end

  def current_board
    puts "TODO board stuff"
  end

  def play
    puts "************************************"
    puts "***  Welcome to Tower of Hanoi!  ***"
    puts "************************************"
    puts "Instructions:"
    puts "Enter where you'd like to move from and to in the format [1,3]. Enter 'q' to quit. Current Board:"

    current_board
  end
end

