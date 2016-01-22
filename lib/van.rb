
require_relative 'docking_station'

class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_bikes(station)
    @bikes = station.release_broken
  end

  def deliver_bikes(garage)
    garage.receive_bikes(@bikes)
    @bikes = []
  end

end
