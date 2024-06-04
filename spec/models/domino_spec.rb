require "rails_helper"

RSpec.describe Domino, type: :model do
  describe "in general" do
    let(:domino) { Domino.new(0, 4) }

    it "has a lhs and a rhs" do
      expect(domino.lhs).to eq(0)
      expect(domino.rhs).to eq(4)
    end

    it "raises an ArgumentError when an input is over 6" do
      expect { Domino.new(7, 0) }.to raise_error(ArgumentError)
    end
  end

  describe "equality" do
    it "returns true if lhs and rhs are the same" do
      d1 = Domino.new(1, 2)
      d2 = Domino.new(1, 2)

      expect(d1).to eql(d2)
    end

    it "returns true if lhs and rhs are flipped, but otherwise the same" do
      d1 = Domino.new(1, 2)
      d2 = Domino.new(2, 1)

      expect(d1).to eql(d2)
      expect(d2).to eql(d1)
    end

    it "returns false if a single number is different" do
      d1 = Domino.new(1, 4)
      d2 = Domino.new(2, 1)

      expect(d1).not_to eql(d2)
    end
  end

  describe "#double?" do
    it "returns true if lhs and rhs are the same" do
      expect(Domino.new(0, 0).double?).to be true
      expect(Domino.new(1, 1).double?).to be true
      expect(Domino.new(2, 2).double?).to be true
      expect(Domino.new(3, 3).double?).to be true
      expect(Domino.new(4, 4).double?).to be true
      expect(Domino.new(5, 5).double?).to be true
      expect(Domino.new(6, 6).double?).to be true
    end

    it "returns false if lhs and rhs are different" do
      expect(Domino.new(3, 6).double?).to be false
      expect(Domino.new(2, 5).double?).to be false
      expect(Domino.new(0, 1).double?).to be false
    end
  end
end
