require 'garage'

describe Garage do

  bike = Bike.new
  bike2 = Bike.new
  ds = DockingStation.new
  ds.dock_bike(bike)
  ds.dock_bike(bike2, false)
  van = Van.new
  broken = van.collect_broken(ds)

  it 'takes broken bikes from the van' do
    van.delivers_broken(subject)
    expect(subject.broken_bikes).to eq broken
  end

  it 'is empty after the van collects' do
    van.delivers_broken(subject)
    van.collect_fixed(subject)
    expect(subject.broken_bikes).to be_empty
  end

end
