require_relative 'bike'

class DockingStation
	def release_bike
		Bike.new
	end
end

docking_station = DockingStation.new