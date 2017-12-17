class Simulator

  attr_reader :robot

  def initialize
    @robot = Robot.new
  end

  def follow_command(command)
    (cmd, x_position, y_position, facing) = parseCommand(command)
    @robot.execute_command(cmd, x_position, y_position, facing)
  end

  private

  def parseCommand(command)
    (cmd,args) = command.split(' ')
    raiseInvalidCommandError if cmd.nil? || !Robot::COMMANDS.include?(cmd.to_sym)
    if args
      arr = args.split(',')
      if valid_args?(arr)
        (x_position, y_position, facing) = [arr[0].to_i, arr[1].to_i, arr[2].to_sym]
        return [cmd.to_sym, x_position, y_position, facing]
      end
    else
      return [cmd] unless cmd == "PLACE"
      raiseInvalidCommandError
    end
  end

  def valid_args?(arr)
    if (arr.length == 3 && arr[0].to_i.to_s == arr[0] && arr[1].to_i.to_s == arr[1])
      return true
    else
      raiseInvalidCommandError
    end
  end

  def raiseInvalidCommandError
    raise StandardError, "Invalid command!"
  end

end
