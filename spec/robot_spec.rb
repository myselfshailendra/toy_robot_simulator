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

  describe '#execute_command' do
    it 'executes all robot commands' do
      robot.execute_command(:PLACE,1,2,:NORTH)
      robot.execute_command(:LEFT,nil,nil,nil)
      robot.execute_command(:MOVE,nil,nil,nil)
      robot.execute_command(:RIGHT,nil,nil,nil)
      expect(robot.execute_command(:REPORT,nil,nil,nil)).to eq 'POSITION = (0,2) NORTH'
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
    context 'when move is unsafe' do
      it 'gives warning when robot stand on 4,4,EAST and still try to move' do
        robot.place(4,4,:EAST)
        expect{robot.move}.to raise_error(StandardError, "Invalid move! Robot can be fall!")
      end
      it 'gives warning when robot stand on 0,0,SOUTH and still try to move' do
        robot.place(0,0,:SOUTH)
        expect{robot.move}.to raise_error(StandardError, "Invalid move! Robot can be fall!")
      end
    end
    context 'when move is safe' do
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

  describe '#left' do
    it '1 time turns robot left from EAST facing' do
      robot.place(2,3,:EAST)
      robot.left
      expect(robot.facing).to eq :NORTH
    end
    it '3 time turns robot left from SOUTH facing' do
      robot.place(1,4,:SOUTH)
      robot.left
      robot.left
      robot.left
      expect(robot.facing).to eq :WEST
    end
  end

  describe '#right' do
    it '1 time turns robot right from EAST facing' do
      robot.place(3,1,:EAST)
      robot.right
      expect(robot.facing).to eq :SOUTH
    end
    it '3 time turns robot left from EAST facing' do
      robot.place(1,4,:EAST)
      robot.right
      robot.right
      robot.right
      expect(robot.facing).to eq :NORTH
    end
  end

  describe '#report' do
    it 'shows robot position' do
      robot.place(3,1,:EAST)
      expect(robot.report).to eq 'POSITION = (3,1) EAST'
    end
  end

end
