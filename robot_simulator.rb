require './lib/robot'
require './lib/surface'
require './lib/simulator'

prompt = '> '
print "Enter your command:\n\n#{prompt}"

simulator = Simulator.new

while command = gets.chomp.upcase
  break if command == 'EXIT'
  begin
    simulator.follow_command(command)
  rescue StandardError => e
    puts e.message
    print prompt
    next
  end
  print prompt
end
