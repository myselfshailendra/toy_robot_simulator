class Robot

  attr_accessor :surface, :x_position, :y_position, :facing
  DIRECTIONS = [:NORTH, :WEST, :SOUTH, :EAST]
  COMMANDS = [:PLACE, :MOVE, :LEFT, :RIGHT, :REPORT]

  def initialize
    @surface = Surface.new
  end

  def execute_command(command, x_position, y_position, facing)
    return self.place(x_position, y_position, facing) if (command == :PLACE)
    if robot_placed?
      case command.to_sym
      when :MOVE then self.move
      when :LEFT then self.left
      when :RIGHT then self.right
      when :REPORT then self.report
      end
    end
  end

  def place(x_position, y_position, facing)
    if self.surface.valid_position?(x_position, y_position) && valid_facing?(facing)
      self.x_position = x_position
      self.y_position = y_position
      self.facing = facing
    end
  end

  def move
    if self.surface.is_next_move_valid?(self.x_position, self.y_position, self.facing)
      case self.facing
      when :NORTH then self.y_position += 1
      when :SOUTH then self.y_position -= 1
      when :EAST then self.x_position += 1
      when :WEST then self.x_position -= 1
      end
    end
  end

  def left
    self.facing = DIRECTIONS[(DIRECTIONS.index(self.facing) + 1) % DIRECTIONS.length]
  end

  def right
    self.facing = DIRECTIONS[(DIRECTIONS.index(self.facing) - 1) % DIRECTIONS.length]
  end

  def report
    puts position = 'POSITION = (' + self.x_position.to_s + ',' + self.y_position.to_s + ') ' + self.facing.to_s
    return position
  end

  private

  def robot_placed?
    return true if (self.x_position != nil || self.y_position != nil || self.facing != nil)
    raise StandardError, "Please place robot first!"
  end

  def valid_facing?(facing)
    return true if DIRECTIONS.include?(facing)
    raise StandardError, "`#{facing}` is not belongs to valid facing directions [NORTH, EAST, SOUTH and WEST]"
  end

end
