class Garage
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def receive_bikes(bikes)
    @bikes = bikes
    fix_bikes
  end

  def release_bikes
    @bikes.pop(@bikes.size)
  end

  private
  def fix_bikes
    @bikes.each(&:got_fixed)
  end
end
