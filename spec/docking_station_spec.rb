require 'docking_station'

#describe DockingStation do
#	it "Class instance should respond to release_bike" do
#		expect(subject).to respond_to :release_bike
#	end	
#end

describe DockingStation do
	it { is_expected.to respond_to :release_bike}
end