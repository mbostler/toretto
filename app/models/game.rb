# frozen_string_literal: true

# Represents a single match of two players against each other.
class Game
  attr_accessor :players, :boneyard, :next_turn

  def initialize
    @players = [Player.new, Player.new]
    @boneyard = DominoSet.build.dominos
    3.times { @boneyard.shuffle }

    deal_initial_hand

    @next_turn = assign_next_turn(@players[0], @players[1])
  end

  def deal_initial_hand
    7.times { @players[0].hand << @boneyard.pop }
    7.times { @players[1].hand << @boneyard.pop }
  end

  def assign_next_turn(player_one, player_two)
    in_hand = (player_one.hand + player_two.hand).sort! do |x, y|
      (x.lhs + x.rhs) <=> (y.lhs + y.rhs)
    end

    in_hand.reverse!

    top = in_hand.find(&:double?) || in_hand.first

    return player_one if player_one.hand.include?(top)

    player_two
  end
end
