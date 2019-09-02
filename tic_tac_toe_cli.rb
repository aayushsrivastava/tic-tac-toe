require "./game"

game = Game.new

loop do
  system("clear") || system("cls")
  puts game.progress
  break if game.over?
  choice = Integer(gets) rescue nil
  game.play(choice) if choice
end
