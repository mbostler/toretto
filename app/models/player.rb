# frozen_string_literal: true

# Represents one of two parties playing a domino game.
class Player
  attr_accessor :hand

  def initialize
    @hand = []
  end
end
