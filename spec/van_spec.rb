require 'van'

describe Van do
  let(:station) { double :docking_station }
  let(:working_bike) {double(:bike, :working => true)}
  let(:broken_bike) {double(:bike, :working => false)}

  describe '#collect_bikes' do
    it {is_expected.to respond_to(:collect_bikes).with(1).argument}

    it 'allows vans to collect bikes' do
      allow(station).to receive(:release_broken).and_return([broken_bike])
      allow(station).to receive(:bikes).and_return([broken_bike, working_bike])

      subject.collect_bikes(station)
      expect(subject.bikes).to eq [broken_bike]
    end
  end

  describe '#deliver_bikes' do
    it {is_expected.to respond_to(:deliver_bikes).with(1).argument}

    let(:broken_bike2) { double(:bike, :working => false) }
    let(:station) { double(:docking_station, :release_broken => [broken_bike, broken_bike2], :bikes => [broken_bike, broken_bike2]) }
    let(:garage) { double(:garage) }

    it 'delivers broken bikes to a garage' do
      allow(garage).to receive(:receive_bikes)
      
      subject.collect_bikes(station)
      subject.deliver_bikes(garage)
      expect(subject.bikes).to be_empty
    end



  end

end
