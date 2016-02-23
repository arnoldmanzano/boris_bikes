require 'docking_station'

describe DockingStation do
  subject(:station) { described_class.new }
  let(:bike) { double(:bike, working: true) }
  let(:broken_bike) { double(:bike, working: false) }


  describe '#initialize' do
    it 'has a default capacity' do
      expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'can override capacity on initialize' do
      expect(DockingStation.new(3).capacity).to eq 3
    end
  end

  describe '#release_bike' do
    it 'releases working bikes' do
      station.dock(bike)
      expect(station.release_bike).to eq bike
    end

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
      expect(station.dock(bike)).to include bike
    end

    it 'raises an error if at capacity' do
      station.capacity.times { station.dock double(:bike) }
      expect{station.dock(bike)}.to raise_error("Dock full")
    end

    it 'docks broken bikes' do
      allow(bike).to receive(:working).and_return(false)

      expect(station.dock(bike)).to include bike
    end

  end

  describe '#release_bikes' do
    let(:broken_bike) { double(:broken_bike, :working => false) }
    let(:bike) { double(:bike, :working => true) }

    it 'release only broken bikes' do
      station.dock(bike)
      station.dock(broken_bike)
      expect(station.release_bikes).to eq [broken_bike]
    end

    it 'removes broken bikes from station' do
      station.dock(bike)
      station.dock(broken_bike)
      station.release_bikes
      expect(station.bikes).to eq [bike]
    end

    it 'raises an error when no broken bikes' do
      station.dock(bike)
      expect { station.release_bikes }.to raise_error("No broken bikes")
    end
  end

  describe '#receive_bikes' do
    let(:bike2) { double(:bike2) }

    it 'receives fixed bikes from a van' do
      station.receive_bikes([bike])
      expect(station.bikes).to eq [bike]
    end

    it 'adds received bike to existing bikes in station' do
      station.dock(bike2)
      station.receive_bikes([bike])
      expect(station.bikes).to eq [bike2, bike]
    end
  end
end
