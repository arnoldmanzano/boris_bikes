class Bike
  def initialize
    @working = true
  end

  def working?
    @working
  end

  def got_broken
    @working = false
  end

  def got_fixed
    @working = true
    self
  end
end
