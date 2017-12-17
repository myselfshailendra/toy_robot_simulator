require 'rspec'
require './lib/simulator'
require './lib/surface'
require './lib/robot'

describe Simulator do

  let(:simulator) { Simulator.new }
  let(:robot) { simulator.robot }

  describe '#new' do
    it 'initialize new instances for simulator and robot' do
      expect(simulator).to be_a Simulator
      expect(robot).to be_a Robot
    end
  end

end
