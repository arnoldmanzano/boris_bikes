require 'bike'

describe Bike do
  subject(:bike) { described_class.new }

  describe '#initialize' do
    it "has a default state of working" do
      expect(bike).to be_working
    end
  end

  describe '#broken' do
    it "can be broken" do
      bike.broken
      expect(bike).to_not be_working
    end
  end

  describe '#fix' do
    it "can be fixed" do
      bike.broken
      bike.fix
      expect(bike).to be_working
    end
  end
end
