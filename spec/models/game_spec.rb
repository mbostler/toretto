require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) { Game.new }

  describe "on init" do
    let(:p1) { game.players.first }
    let(:p2) { game.players.second }
    let(:boneyard) { game.boneyard }

    it "has 2 players" do
      expect(game.players.size).to be 2
    end

    it "deals 7 dominos to each player" do
      expect(p1.hand.size).to be 7
      expect(p2.hand.size).to be 7
    end

    it "has 14 dominos in the boneyard" do
      expect(boneyard.size).to be 14
    end

    describe "assigning first turn" do
      it "sets next_turn to whoever has highest double" do
        allow(p1).to receive(:hand) { [Domino.new(2,3), Domino.new(5,6)] }
        allow(p2).to receive(:hand) { [Domino.new(4,3), Domino.new(2,2)] }

        expect(game.assign_next_turn(p1, p2)).to eql(p2)
      end

      it "sets next_turn to whoever has highest sum if no doubles found" do
        allow(p1).to receive(:hand) { [Domino.new(2,3), Domino.new(5,6)] }
        allow(p2).to receive(:hand) { [Domino.new(4,3), Domino.new(2,0)] }

        expect(game.assign_next_turn(p1, p2)).to eql(p1)
      end
    end
  end

end
