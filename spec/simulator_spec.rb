require 'rspec'
require './lib/simulator'

describe Simulator do

  let(:simulator) { Simulator.new }

  describe '#new' do
    it 'initialize new instance for simulator' do
      expect(simulator).to be_a Simulator
    end
  end

end
