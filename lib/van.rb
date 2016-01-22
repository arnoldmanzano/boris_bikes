require_relative 'docking_station'

class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  # Universal #collect method for stations and garages
  def collect_from(station_or_garage)
    # Requires both station and garage to have a #release method
    @bikes = station_or_garage.release
  end

  def deliver_to(station_or_garage)
    station_or_garage.receive_bikes(@bikes.pop(@bikes.size))
  end

end
