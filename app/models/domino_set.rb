# frozen_string_literal: true

# DominoSet does cool stuff when it can.
class DominoSet
  attr_accessor :dominos

  # Error from dominoSet
  class Error < StandardError
    def message
      "Already exists in set"
    end
  end

  def self.build
    new.tap do |ds|
      (0..6).each do |lhs|
        (0..6).each do |rhs|
          domino = Domino.new(lhs, rhs)
          (ds << domino) unless ds.contains?(domino)
        end
      end
    end
  end

  def initialize
    @dominos = []
  end

  def add(domino)
    raise Error, "Already exists in set" if contains?(domino)

    @dominos << domino
  end
  alias << add

  def contains?(domino)
    @dominos.include?(domino)
  end
end
