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
    context 'when command is wrong' do
      it { expect{simulator.follow_command('PLACE 1,2,N')}.to raise_error(StandardError, "`N` is not belongs to valid facing directions [NORTH, EAST, SOUTH and WEST]") }
      it { expect{simulator.follow_command('PLACE')}.to raise_error(StandardError, "Invalid command!") }
      it { expect{simulator.follow_command('MOVES')}.to raise_error(StandardError, "Invalid command!") }
      it { expect{simulator.follow_command('MOVE MOVE')}.to raise_error(StandardError, "Invalid command!") }
      it { expect{simulator.follow_command('LEFT LEFT')}.to raise_error(StandardError, "Invalid command!") }
      it { expect{simulator.follow_command('RIGHT RIGTH')}.to raise_error(StandardError, "Invalid command!") }
      it { expect{simulator.follow_command('REPOT')} .to raise_error(StandardError, "Invalid command!") }
      it { expect{simulator.follow_command('')} .to raise_error(StandardError, "Invalid command!") }
      it { expect{simulator.follow_command(' ')} .to raise_error(StandardError, "Invalid command!") }
      it { expect{simulator.follow_command('ANY RANDOM WRONG COMMAND')} .to raise_error(StandardError, "Invalid command!") }
    end

    context 'when robot not placed, ignores command' do
      it { expect{simulator.follow_command('MOVE')}.to raise_error(StandardError, "Please place robot first!") }
      it { expect{simulator.follow_command('LEFT')}.to raise_error(StandardError, "Please place robot first!") }
      it { expect{simulator.follow_command('RIGHT')}.to raise_error(StandardError, "Please place robot first!") }
      it { expect{simulator.follow_command('REPORT')}.to raise_error(StandardError, "Please place robot first!") }
    end
  end

end
