class Surface

  attr_reader :x_max_position, :y_max_position

  def initialize(x_max_position = 5, y_max_position = 5)
    @x_max_position = x_max_position
    @y_max_position = y_max_position
  end

  def valid_position?(x_position, y_position)
    return true if (0...self.x_max_position).to_a.include?(x_position) && (0...self.y_max_position).to_a.include?(y_position)
    raise StandardError, "Position is not valid!"
  end

  def is_next_move_valid?(current_x_position, current_y_position, current_facing)
    valid = case current_facing
    when :NORTH then (current_y_position < (self.y_max_position - 1))
    when :SOUTH then (current_y_position > 0)
    when :EAST then (current_x_position < (self.x_max_position - 1))
    when :WEST then (current_x_position > 0)
    end
    valid ? (return true) : (raise StandardError, "Invalid move! Robot can be fall!")
  end

end
