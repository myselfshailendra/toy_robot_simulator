class Surface

  attr_reader :x_max_position, :y_max_position

  def initialize(x_max_position = 5, y_max_position = 5)
    @x_max_position = x_max_position
    @y_max_position = y_max_position
  end

end
