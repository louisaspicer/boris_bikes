require './lib/docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

end

describe 'release_bike' do
  it "return bike" do
    expect(DockingStation.new.release_bike).to be_a Bike
end
