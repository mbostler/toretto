class DominoSet
  attr_accessor :dominos

  class Error < StandardError
    def message
      "Oh boy"
    end
  end

  def self.build
    new.tap do |ds|
      (0..6).each do |lhs|
        (0..6).each do |rhs|
          begin
            ds << Domino.new(lhs, rhs)
          rescue Error
          end
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
  alias_method :<<, :add

  def contains?(domino)
    @dominos.include?(domino)
  end
end
