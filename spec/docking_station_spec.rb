require 'docking_station_class'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it { expect(subject.generate_bike).to be_an_instance_of(Bike) }

  it { expect(subject.generate_bike.working?).to eq true }

  it { is_expected.to respond_to :dock }

  it {is_expected.to respond_to(:all_bikes)}

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.all_bikes).to eq subject.all_bikes
  end

  it 'raises error if no bikes' do
    expect { subject.release_bike }.to raise_error(RuntimeError, "No bikes available")
  end

  it 'raises error if docking station is full' do
    bike = Bike.new
    20.times { subject.dock(bike) }
    expect { subject.dock(bike) }.to raise_error(RuntimeError, "Docking station full")
  end

  it 'adds a bike to array when docked' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.all_bikes.length).to eq 1
  end

  it 'removes a bike when a bike is released' do
    subject.all_bikes = ["Louisa", "Jenna"]
    subject.release_bike
    expect(subject.all_bikes.length).to eq 1
  end

  it 'sets a default docking station capacity to 20' do
    expect(subject.capacity).to eq 20
  end


end
