require 'rspec'
require './lib/robot'
require './lib/surface'

describe Robot do

  let(:robot) { Robot.new }
  let(:surface) { robot.surface }

  describe '#new' do
    it 'initialize new instance of robot' do
      expect(robot).to be_a Robot
      expect(surface).to be_a Surface
    end
  end

end
