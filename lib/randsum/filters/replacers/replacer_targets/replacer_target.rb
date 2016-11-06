module Randsum
  class ReplacerTarget
    ALL = :all
    attr_reader :target, :roll

    def self.for(target, roll:)
      case target
      when ALL
        ReplacerTargetAll
      when nil
        ReplacerTargetAll
      else
        ReplacerTarget
      end.new(target, roll: roll)
    end

    def initialize(target, roll:)
      @target = target
      @roll = roll
    end

    def match
      roll.result.select do |r|
        r == target
      end
    end
  end
end
