require 'docking_station_class'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it { expect(DockingStation.new.release_bike).to be_an_instance_of(Bike) }

  it { expect(DockingStation.new.release_bike.working?).to eq true }
end
