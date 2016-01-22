require 'van'

describe Van do
  let(:station) { double :docking_station }
  let(:garage) { double :garage }
  let(:working_bike) {double(:bike, :working => true)}
  let(:broken_bike) {double(:bike, :working => false)}

  describe '#collect_from' do
    it {is_expected.to respond_to(:collect_from).with(1).argument}

    it 'allows vans to collect bikes from docking station' do
      allow(station).to receive(:release).and_return([broken_bike])
      allow(station).to receive(:bikes).and_return([broken_bike, working_bike])

      subject.collect_from(station)
      expect(subject.bikes).to eq [broken_bike]
    end

    it 'allows vans to collect bikes from garages' do
      allow(garage).to receive(:release).and_return([working_bike])

      subject.collect_from(garage)

      expect(subject.bikes).to eq [working_bike]
    end
  end

  describe '#deliver_to' do
    it {is_expected.to respond_to(:deliver_to).with(1).argument}

    let(:broken_bike2) { double(:bike, :working => false) }
    let(:station) { double(:docking_station, :release => [broken_bike, broken_bike2], :bikes => [broken_bike, broken_bike2]) }
    let(:garage) { double(:garage) }

    it 'delivers broken bikes to a garage' do
      allow(garage).to receive(:receive_bikes)

      subject.collect_from(station)
      subject.deliver_to(garage)
      expect(subject.bikes).to be_empty
    end

    it 'delivers fixed bikes to a station' do
      allow(garage).to receive(:release).and_return([working_bike])
      expect(station).to receive(:receive_bikes)

      subject.collect_from(garage)
      subject.deliver_to(station)
      expect(subject.bikes).to be_empty
    end
  end
end
