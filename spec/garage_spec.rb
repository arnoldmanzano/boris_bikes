require 'garage'

describe Garage do
  subject(:garage) { described_class.new }
  let(:bike) { double(:bike, got_fixed: nil) }
  let(:van) { double(:van, bikes: [bike]) }

  describe '#initialize' do
    it 'initializes with no bikes' do
      expect(garage.bikes).to be_empty
    end
  end

  describe '#receive_bikes' do
    it 'receives broken bikes from a van' do
      garage.receive_bikes(van.bikes)
      expect(garage.bikes).to contain_exactly(bike)
    end

    it 'fixes received bikes' do
      expect(bike).to receive(:got_fixed)
      garage.receive_bikes(van.bikes)
    end
  end

  describe '#release_bikes' do
    it 'releases fixed bikes' do
      garage.receive_bikes(van.bikes)
      expect(garage.release_bikes).to contain_exactly(bike)
      expect(garage.bikes).not_to include(bike)
    end
  end
end
