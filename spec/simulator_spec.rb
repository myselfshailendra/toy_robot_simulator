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

  describe '#follow_command' do
    it { expect{simulator.follow_command('MOVE')}.to raise_error(StandardError, "Please place robot first!") }
    it { expect{simulator.follow_command('LEFT')}.to raise_error(StandardError, "Please place robot first!") }
    it { expect{simulator.follow_command('RIGHT')}.to raise_error(StandardError, "Please place robot first!") }
    it { expect{simulator.follow_command('REPORT')}.to raise_error(StandardError, "Please place robot first!") }
  end

end
