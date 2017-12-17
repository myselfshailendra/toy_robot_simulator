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

end
