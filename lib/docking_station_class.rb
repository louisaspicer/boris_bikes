require './lib/bike.rb'

class DockingStation

  attr_reader :bike

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
    @bike = bike
  end

end
