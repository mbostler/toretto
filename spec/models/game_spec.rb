# frozen_string_literal: true

require "rails_helper"

RSpec.describe Game do
  let(:game) { Game.new }

  describe "on init" do
    let(:player_one) { game.players.first }
    let(:player_two) { game.players.second }
    let(:boneyard) { game.boneyard }

    it "has 2 players" do
      expect(game.players.size).to be 2
    end

    it "deals 7 dominos to each player" do
      expect(player_one.hand.size).to be 7
      expect(player_two.hand.size).to be 7
    end

    it "has 14 dominos in the boneyard" do
      expect(boneyard.size).to be 14
    end

    describe "assigning first turn" do
      it "sets next_turn to whoever has highest double" do
        allow(player_one).to receive(:hand) { [Domino.new(2, 3), Domino.new(5, 6)] }
        allow(player_two).to receive(:hand) { [Domino.new(4, 3), Domino.new(2, 2)] }

        expect(game.assign_next_turn(player_one, player_two)).to eql(player_two)
      end

      it "sets next_turn to whoever has highest sum if no doubles found" do
        allow(player_one).to receive(:hand) { [Domino.new(2, 3), Domino.new(5, 6)] }
        allow(player_two).to receive(:hand) { [Domino.new(4, 3), Domino.new(2, 0)] }

        expect(game.assign_next_turn(player_one, player_two)).to eql(player_one)
      end
    end
  end
end
