require 'docking_station'

describe DockingStation do
	it { is_expected.to respond_to :release_bike}
	it { expect(subject.release_bike.class).to eq Bike }

	it 'released working bikes' do
		bike = subject.release_bike
		expect(bike).to be_working
	end

	it { is_expected.to respond_to(:dock).with(1).argument }

  it 'docks bike to station' do
		bike = Bike.new
		expect(subject.dock(bike)).to eq bike
  end

	it 'shows docked bike with same id' do
		bike = Bike.new
		subject.dock(bike)
		expect(subject.bike).to eq bike
	end

#	it { expect(subject.bike_count).to be <= 10 }
#  it 'docks bike to station, increasing bike_count' do
#		initial_bikes = subject.bike_count
#		final_bikes = subject.dock_bike(Bike.new)
#		expect(final_bikes).to be > initial_bikes
#	end

end
