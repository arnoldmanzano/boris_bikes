require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end


  def release_bike
    raise "No bikes" if empty?
    @bikes.each { |bike| return @bikes.delete(bike) if bike.working }
    raise "No working bikes"
  end

  def dock(bike)
    raise "Dock full" if full?
    @bikes << bike
  end

  def release
    broken_bikes = []

    @bikes.each do |bike|
      broken_bikes << @bikes.delete(bike) if !bike.working
    end

    !broken_bikes.empty? ? broken_bikes : raise("No broken bikes")
  end

  def receive_bikes(fixed_bikes)
    @bikes += fixed_bikes
  end

  private

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.count == 0
  end

end
