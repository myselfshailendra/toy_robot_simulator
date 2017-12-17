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

end
