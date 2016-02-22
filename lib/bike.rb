class Bike

#  attr_reader :working

  def working?
    @working
  end

  def initialize
    @working = true
  end

  def broken
    @working = false
  end

  def fix
    @working = true
    self
  end
end
