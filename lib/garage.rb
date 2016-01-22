require_relative 'van'

class Garage
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def receive_bikes(bikes)
    @bikes = bikes
    fix_bikes
    @bikes
  end

  private

  def fix_bikes
    @bikes.each(&:fix)
  end
end
