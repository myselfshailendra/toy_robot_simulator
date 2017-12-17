require 'rspec'
require './lib/surface'

describe Surface do

  let(:surface) { Surface.new }

  describe '#new' do
    context 'initialize a new instance' do
      it 'initialize a new instance with default values' do
        expect(surface).to be_a Surface
        expect(surface.x_max_position).to eq 5
        expect(surface.y_max_position).to eq 5
      end
    end
  end

  describe '#valid_position?' do
    context 'when position is valid' do
      it { expect(surface.valid_position?(1,2)).to be true }
      it { expect(surface.valid_position?(0,0)).to be true }
      it { expect(surface.valid_position?(4,2)).to be true }
      it { expect(surface.valid_position?(3,1)).to be true }
    end
    context 'when position is not valid' do
      it { expect{surface.valid_position?(-1,0)}.to raise_error(StandardError, "Position is not valid!") }
      it { expect{surface.valid_position?(4,5)}.to raise_error(StandardError, "Position is not valid!") }
      it { expect{surface.valid_position?(5,5)}.to raise_error(StandardError, "Position is not valid!") }
      it { expect{surface.valid_position?(0,5)}.to raise_error(StandardError, "Position is not valid!") }
    end
  end

  describe '#is_next_move_valid?' do
    context 'when next move is valid' do
      it { expect(surface.is_next_move_valid?(1,2,:WEST)).to be true }
      it { expect(surface.is_next_move_valid?(3,2,:EAST)).to be true }
      it { expect(surface.is_next_move_valid?(2,1,:SOUTH)).to be true }
      it { expect(surface.is_next_move_valid?(2,3,:NORTH)).to be true }
      it { expect(surface.is_next_move_valid?(2,4,:EAST)).to be true }
    end
    context 'when next move is not valid' do
      it { expect{surface.is_next_move_valid?(0,2,:WEST)}.to raise_error(StandardError, "Invalid move! Robot can be fall!") }
      it { expect{surface.is_next_move_valid?(4,2,:EAST)}.to raise_error(StandardError, "Invalid move! Robot can be fall!") }
      it { expect{surface.is_next_move_valid?(2,0,:SOUTH)}.to raise_error(StandardError, "Invalid move! Robot can be fall!") }
      it { expect{surface.is_next_move_valid?(2,4,:NORTH)}.to raise_error(StandardError, "Invalid move! Robot can be fall!") }
    end
  end

end
