# frozen_string_literal: true

# Represents a single domino from a set of 28 unique dominos.
class Domino
  attr_accessor :lhs, :rhs

  def initialize(lhs, rhs)
    @lhs = lhs
    @rhs = rhs

    validate!
  end

  def ==(other)
    (@lhs == other.lhs && @rhs == other.rhs) ||
      (@lhs == other.rhs && @rhs == other.lhs)
  end
  alias eql? ==

  def hash
    [lhs, rhs].sort.hash
  end

  def double?
    @lhs == @rhs
  end

  def validate!
    validate_side!(@lhs) && validate_side!(rhs)
  end

  private

  def validate_side!(input)
    return true if (0..6).cover?(input)

    raise ArgumentError, "input must be between 0 and 6"
  end
end
