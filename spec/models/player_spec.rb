# frozen_string_literal: true

require_relative "../rails_helper"

RSpec.describe Player do
  context "with a new player" do
    let(:player) { Player.new }

    it "has empty hand to start" do
      expect(player.hand.empty?).to be true
    end
  end
end
