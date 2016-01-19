require 'docking_station'

#describe DockingStation do
#	it "Class instance should respond to release_bike" do
#		expect(subject).to respond_to :release_bike
#	end	
#end

describe DockingStation do
	it { is_expected.to respond_to :release_bike}
#	it { expect(DockingStation.new.release_bike.class).to eq Bike }
	it { expect(subject.release_bike.class).to eq Bike }
	it 'released working bikes' do
		bike = subject.release_bike
		expect(bike).to be_working
	end
end