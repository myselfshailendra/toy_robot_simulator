require 'rspec'
require './lib/robot'

describe Robot do

  let(:robot) { Robot.new }

  describe '#new' do
    it 'initialize new instance of robot' do
      expect(robot).to be_a Robot
    end
  end

end
