require 'bike'

describe Bike do

  describe '#initialize' do
    it "has a default state of working" do
      # expect((Bike.new).working).to be_truthy
      expect(subject).to be_working
    end
  end

  describe '#broken' do
    it "can be broken" do
      expect((Bike.new).broken).to be false
    end
  end

end
