require './lib/bike.rb'

class DockingStation

  attr_accessor :capacity, :all_bikes

  def initialize(capacity = 20)
    @capacity = capacity
    @all_bikes = []
  end

  def release_bike
    raise(RuntimeError, "No bikes available") if @all_bikes.length == 0
    generate_bike

  end

  def generate_bike
    Bike.new
  end


  def dock(bike)
    raise(RuntimeError, "Docking station full") if @all_bikes.length == @capacity
    @all_bikes << bike
  end

end
