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

end
