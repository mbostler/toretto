class Game
  attr_accessor :players, :boneyard, :next_turn

  def initialize()
    @players = [Player.new, Player.new]
    @boneyard = DominoSet.build.dominos
    3.times { @boneyard.shuffle }

    7.times { @players[0].hand << @boneyard.pop }
    7.times { @players[1].hand << @boneyard.pop }

    @next_turn = assign_next_turn(@players[0], @players[1])
  end

  def assign_next_turn(p1, p2)
    in_hand = (p1.hand + p2.hand).sort! { |x, y| (x.lhs + x.rhs) <=> (y.lhs + y.rhs) }.reverse

    top = in_hand.find(&:double?) || in_hand.first

    return p1 if p1.hand.include?(top)
    return p2
  end
end
