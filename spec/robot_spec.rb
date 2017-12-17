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

  describe '#place' do
    context 'when position is not valid' do
      it { expect{robot.place(-1,0,:NORTH)}.to raise_error(StandardError, "Position is not valid!") }
      it { expect{robot.place(6,6,:WEST)}.to raise_error(StandardError, "Position is not valid!") }
    end
    context 'when facing is not valid' do
      it { expect{robot.place(2,3,:FIFTH)}.to raise_error(StandardError, "`FIFTH` is not belongs to valid facing directions [NORTH, EAST, SOUTH and WEST]") }
      it { expect{robot.place(1,4,:XYZ)}.to raise_error(StandardError, "`XYZ` is not belongs to valid facing directions [NORTH, EAST, SOUTH and WEST]") }
    end
    context 'when position and facing both are valid' do
      it 'place robot on position 1,2,NORTH' do
        robot.place(1,2,:NORTH)
        expect(robot.x_position).to eq 1
        expect(robot.y_position).to eq 2
        expect(robot.facing).to eq :NORTH
      end
      it 'place robot on position 3,4,WEST' do
        robot.place(3,4,:WEST)
        expect(robot.x_position).to eq 3
        expect(robot.y_position).to eq 4
        expect(robot.facing).to eq :WEST
      end
    end
  end

  describe '#move' do
    it 'place robot from position 2,2,NORTH to 2,3,NORTH' do
      robot.place(2,2,:NORTH)
      robot.move
      expect(robot.x_position).to eq 2
      expect(robot.y_position).to eq 3
      expect(robot.facing).to eq :NORTH
    end
    it 'place robot from position 2,2,WEST to 0,2,WEST' do
      robot.place(2,2,:WEST)
      robot.move
      robot.move
      expect(robot.x_position).to eq 0
      expect(robot.y_position).to eq 2
      expect(robot.facing).to eq :WEST
    end
    it 'place robot from position 2,2,SOUTH to 2,0,SOUTH' do
      robot.place(2,2,:SOUTH)
      robot.move
      robot.move
      expect(robot.x_position).to eq 2
      expect(robot.y_position).to eq 0
      expect(robot.facing).to eq :SOUTH
    end
    it 'place robot from position 2,2,EAST to 3,2,EAST' do
      robot.place(2,2,:EAST)
      robot.move
      expect(robot.x_position).to eq 3
      expect(robot.y_position).to eq 2
      expect(robot.facing).to eq :EAST
    end
  end

end
