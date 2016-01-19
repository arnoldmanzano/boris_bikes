require_relative 'bike'

class DockingStation
#	attr_reader :bike_count
  attr_reader :bike

#	def initialize(bike_count=10)
#		@bike_count = bike_count
#	end

	def release_bike
#		@bike_count -= 1
		raise "NoBikeError" if (@bike == nil)
		@bike
	end

    def dock(bike)
#		@bike_count += 1
#		@bike_count
		@bike = bike
	end
end
