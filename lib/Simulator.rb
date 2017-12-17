class Simulator

  attr_reader :robot

  def initialize
    @robot = Robot.new
  end

  def follow_command(command)
    (cmd,args) = command.split(' ')
    (x_position, y_position, facing) = args.split(',') if args
    @robot.execute_command(cmd.to_sym, x_position, y_position, facing)
  end

end
