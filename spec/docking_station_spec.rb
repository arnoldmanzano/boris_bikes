require 'docking_station'

describe DockingStation do
	it { is_expected.to respond_to :release_bike}

	it 'released working bikes' do
		subject.dock(Bike.new)
		bike = subject.release_bike
		expect(bike).to be_working
	end

	describe '#release_bike' do
		it 'releases a bike.' do
			bike = Bike.new
			subject.dock(bike)
			expect(subject.release_bike).to eq bike
		end

		it 'raise error, no bikes' do
			expect { subject.release_bike }.to raise_error("NoBikeError")
		end


		it 'shows docked bike with same id' do
			bike = Bike.new
			subject.dock(bike)
			expect(subject.bike).to eq bike
		end

		it 'raise error, docking station full' do
			subject.dock(Bike.new)
			bike = Bike.new
		    expect { subject.dock(bike)}.to raise_error("DockingStationFull")
		end
	end

	describe 'dock_bike' do
		it { is_expected.to respond_to(:dock).with(1).argument }
		it 'docks bike to station' do
			bike = Bike.new
			expect(subject.dock(bike)).to eq bike
    	end
    end

   




#	it { expect(subject.bike_count).to be <= 10 }
#  it 'docks bike to station, increasing bike_count' do
#		initial_bikes = subject.bike_count
#		final_bikes = subject.dock_bike(Bike.new)
#		expect(final_bikes).to be > initial_bikes
#	end

end
