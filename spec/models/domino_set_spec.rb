# frozen_string_literal: true

require "rails_helper"

RSpec.describe DominoSet do
  let(:set) { DominoSet.new }

  it "has 28 dominos" do
    expect(DominoSet.build.dominos.size).to eq(28)
  end

  context "when trying to add duplicate dominos" do
    let(:domino) { build(:domino) }

    it "complains" do
      set << domino

      expect { set << Domino.new(domino.lhs, domino.rhs) }.to raise_error(DominoSet::Error)
    end
  end

  describe "#contains?" do
    it "returns true if the same domino is already in the set" do
      set << Domino.new(1, 2)
      expect(set.contains?(Domino.new(1, 2))).to be(true)
      expect(set.contains?(Domino.new(2, 1))).to be(true)
    end
  end
end
