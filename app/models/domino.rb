class Domino
  attr_accessor :lhs, :rhs
  
  def initialize(lhs, rhs)
    validate(lhs)
    validate(rhs)

    @lhs = lhs
    @rhs = rhs
  end

  def ==(other)
    (@lhs == other.lhs && @rhs == other.rhs) ||
      (@lhs == other.rhs && @rhs == other.lhs)
  end
  alias_method :eql?, :==

  def hash
    [lhs, rhs].sort.hash
  end

  def double?
    @lhs == @rhs
  end

  private

  def validate(input)
    return true if (0..6).cover?(input)

    raise ArgumentError, "input must be between 0 and 6"
  end
end
