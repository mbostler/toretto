require 'rails_helper'

RSpec.describe DominoSet, type: :model do
  let(:set) { DominoSet.new }

  context "in general" do
    it "has 28 dominos" do
      expect(DominoSet.build.dominos.size).to eq(28)
    end

    it "doesn't allow duplicates to be added" do
      set << Domino.new(1,2)
      expect { set << Domino.new(1,2) }.to raise_error(DominoSet::Error)
      expect { set << Domino.new(2,1) }.to raise_error(DominoSet::Error)
      expect { set << Domino.new(2,2) }.to_not raise_error
    end
  end

  describe "#contains?" do
    it "returns true if the same domino is already in the set" do
      set << Domino.new(1, 2)
      expect(set.contains?(Domino.new(1,2))).to eq(true)
      expect(set.contains?(Domino.new(2,1))).to eq(true)
    end
  end
end
