require 'docking_station'

describe DockingStation do
  subject(:station) { described_class.new }
  let(:bike) { double(:bike, working: true) }
  let(:broken_bike) { double(:bike, working: false) }
  let(:van) { double(:van, bikes: [bike]) }

  describe '#initialize' do
    it 'has a default capacity' do
      expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'can override capacity on initialize' do
      expect(DockingStation.new(3).capacity).to eq 3
    end
  end

  describe '#release_bike' do
    it 'raises an error if there are no bikes' do
      expect{ station.release_bike }.to raise_error("No bikes")
    end

    it 'will not release a broken bike' do
      station.dock(broken_bike)
      expect{station.release_bike}.to raise_error("No working bikes")
    end

    it 'will release a working bike and not a broken bike' do
      station.dock(broken_bike)
      station.dock(bike)
      station.dock(broken_bike)
      expect(station.release_bike).to eq bike
    end
  end

  describe '#dock' do
    it 'checks if the bike has been docked' do
      station.dock(bike)
      expect(station.bikes).to include bike
    end

    it 'raises an error if at capacity' do
      station.capacity.times { station.dock(bike) }
      expect{ station.dock(bike) }.to raise_error("Dock full")
    end

    it 'can dock a bike and report as broken' do
      expect(bike).to receive(:got_broken)
      station.dock(bike, broken: true)
      expect(station.bikes).to include bike
    end
  end

  describe '#release_bikes' do
    before(:each) do
      station.dock(bike)
      station.dock(broken_bike)
      station.dock(bike)
    end

    it 'releases only broken bikes' do
      expect(station.release_bikes).to contain_exactly(broken_bike)
    end

    it 'removes broken bikes from station' do
      station.release_bikes
      expect(station.bikes).to_not include(broken_bike)
    end

    it 'raises an error when no more broken bikes' do
      station.release_bikes
      expect{ station.release_bikes }.to raise_error("No broken bikes")
    end
  end

  describe '#receive_bikes' do
    it 'receives fixed bikes from a van' do
      station.receive_bikes(van.bikes)
      expect(station.bikes).to include bike
    end

    it 'adds received bike to existing bikes in station' do
      station.dock(broken_bike)
      station.receive_bikes([bike])
      expect(station.bikes).to contain_exactly(broken_bike, bike)
    end
  end
end
