require 'docking_station'

describe 'Feature tests' do
  station = DockingStation.new
  bike1 = Bike.new
  bike2 = Bike.new
  bike3 = Bike.new
  bike4 = Bike.new
  van = Van.new
  garage = Garage.new

  it 'is tested with a usage scenario' do
      expect(station.bikes).to be_empty
      station.dock(bike1)
      station.dock(bike2, broken: true)
      station.dock(bike3, broken: false)
      station.dock(bike4, broken: true)
      station.release_bike
      expect(station.bikes).to contain_exactly(bike2, bike3, bike4)
      van.collect_from(station)
      expect(station.bikes).to contain_exactly(bike3)
      van.deliver_to(garage)
      expect(garage.bikes).to contain_exactly(bike2, bike4)
      van.collect_from(garage)
      van.deliver_to(station)
      expect(station.bikes).to contain_exactly(bike2, bike3, bike4)
      station.release_bike
      station.release_bike
      station.release_bike
      expect(station.bikes).to be_empty
  end
end
