require 'rails_helper'

RSpec.describe Player, type: :model do
  context "a new player" do
    let(:player) { Player.new }

    it "has empty hand to start" do
      expect(player.hand.empty?).to be true
    end
  end
end
