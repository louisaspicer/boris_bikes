require './lib/bike.rb'

class DockingStation

  attr_reader :bike
  attr_accessor :capacity

  def initialize(capacity = 0)
    @capacity = capacity
  end

  def release_bike
    raise(RuntimeError, "No bikes available") if check_for_bikes == false
    generate_bike

  end

  def generate_bike
    Bike.new
  end

  def check_for_bikes
    false
  end

  def dock(bike)
    raise(RuntimeError, "Docking station full") if capacity == 1
    @bike = bike
  end

end
