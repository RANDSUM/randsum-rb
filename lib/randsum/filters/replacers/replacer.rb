module Randsum
  class Replacer
    attr_reader :target, :with, :roll

    def self.for(target:, with:, roll:)
      Randsum::Replacer.new(
        target: target,
        with: with,
        roll: roll,
      )
    end

    def initialize(target:, with:, roll:)
      @target = ReplacerTarget.for(target, roll: roll)
      @with   = ReplacerValue.for(with, roll: roll)
      @roll   = roll
    end

    def filter
      return Randsum::Roll.new(
        die: roll.die,
        quantity: roll.quantity,
        result: result
      )
    end

    def result
      (roll.result - target.match) + transformed
    end

    def transformed
      with.transform(target.match)
    end
  end
end
