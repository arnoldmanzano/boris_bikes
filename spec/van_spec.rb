require 'van'

describe Van do
  subject(:van) { described_class.new }
  let(:station) { double(:docking_station, release_bikes: [bike]) }
  let(:garage) { double(:garage, release_bikes: [bike]) }
  let(:bike) {double :bike }

  describe '#collect_from' do
    it 'allows vans to collect bikes from docking station' do
      expect(station).to receive(:release_bikes)
      van.collect_from(station)
      expect(van.bikes).to contain_exactly(bike)
    end

    it 'allows vans to collect bikes from garages' do
      expect(garage).to receive(:release_bikes)
      van.collect_from(garage)
      expect(van.bikes).to contain_exactly(bike)
    end
  end

  describe '#deliver_to' do
    it 'delivers broken bikes to a garage' do
      van.collect_from(station)
      expect(garage).to receive(:receive_bikes)
      van.deliver_to(garage)
      expect(van.bikes).to be_empty
    end

    it 'delivers fixed bikes to a station' do
      van.collect_from(garage)
      expect(station).to receive(:receive_bikes)
      van.deliver_to(station)
      expect(van.bikes).to be_empty
    end
  end
end
