require './lib/bike.rb'

class DockingStation

  attr_accessor :CAPACITY, :all_bikes

  def initialize(capacity = 20)
    @CAPACITY = capacity
    @all_bikes = []
    generate_bike
  end

  def generate_bike
    @CAPACITY.times do
      @all_bikes << Bike.new
    end
    @all_bikes
  end

  def release_bike
    raise(RuntimeError, "No bikes available") if empty?
    raise("Can't release broken bike") if !(@all_bikes[-1].working?)
    @all_bikes.pop
  end

  def dock(bike)
    raise(RuntimeError, "Docking station full") if full?
    @all_bikes << bike
  end

  private
    def full?
      @all_bikes.length == @CAPACITY
    end

    def empty?
      @all_bikes.length == 0
    end
end
