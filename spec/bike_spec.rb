require 'bike'

describe Bike do
  it {is_expected.to respond_to :working?}
  it {is_expected.to respond_to :report_as_broken}

  it 'marks a bike as broken' do
    subject.report_as_broken
    expect(subject.working?).to eq false
  end

  it 'identifies if a bike is not broken' do
    expect(subject.working?).to eq true
  end


end
