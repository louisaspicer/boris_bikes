require 'docking_station_class'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it { expect(subject.generate_bike).to eq subject.all_bikes }

  it { is_expected.to respond_to :dock }

  it {is_expected.to respond_to(:all_bikes)}

  it 'docks something' do
    subject.all_bikes = []
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'returns docked bikes' do
    subject.all_bikes = []
    bike = Bike.new
    subject.dock(bike)
    expect(subject.all_bikes).to eq subject.all_bikes
  end

  it 'raises error if no bikes to release' do
    subject.all_bikes = []
    expect { subject.release_bike }.to raise_error(RuntimeError, "No bikes available")
  end

  it 'raises error if docking station is full' do
    bike = Bike.new
    expect { subject.dock(bike) }.to raise_error(RuntimeError, "Docking station full")
  end

  it 'adds a bike to array when docked' do
    subject.all_bikes = []
    bike = Bike.new
    subject.dock(bike)
    expect(subject.all_bikes.length).to eq 1
  end

  it 'removes a bike when a bike is released' do
    subject.release_bike
    expect(subject.all_bikes.length).to eq 19
  end

  it 'sets a default docking station capacity to 20' do
    expect(subject.CAPACITY).to eq 20
  end

  it 'allows user to set any capacity' do
    station = DockingStation.new(30)
    expect(station.CAPACITY).to eq 30
  end

  it 'only allows working bikes to be released' do
    bike = subject.release_bike
    bike.report_as_broken
    subject.dock(bike)
    expect { subject.release_bike }.to raise_error("Can't release broken bike")
  end
end
