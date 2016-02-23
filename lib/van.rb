class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_from(place)
    @bikes = place.release_bikes
  end

  def deliver_to(place)
    place.receive_bikes(@bikes.pop(@bikes.size))
  end

end
