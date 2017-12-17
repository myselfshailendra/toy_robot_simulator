class Robot

  attr_accessor :surface, :x_position, :y_position, :facing
  DIRECTIONS = [:NORTH, :WEST, :SOUTH, :EAST]

  def initialize
    @surface = Surface.new
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

  private

  def valid_facing?(facing)
    return true if DIRECTIONS.include?(facing)
    raise StandardError, "`#{facing}` is not belongs to valid facing directions [NORTH, EAST, SOUTH and WEST]"
  end

end
