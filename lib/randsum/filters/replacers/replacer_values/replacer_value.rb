module Randsum
  class ReplacerValue
    REROLL = :reroll
    DOUBLE = :double

    attr_reader :roll, :value

    def self.for(value, roll:)
      case value
      when REROLL
        ReplacerRerollValue
      when DOUBLE
        ReplacerDoubleValue
      else
        ReplacerValue
      end.new(value, roll: roll)
    end

    def initialize(value, roll:)
      @value = value
      @roll  = roll
    end

    def transform(match)
      match.map { value }
    end
  end
end
