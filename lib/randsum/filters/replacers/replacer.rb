# frozen_string_literal: true

module Randsum
  class Replacer
    attr_reader :target, :with, :roll

    def self.for(target:, with:, roll:)
      Randsum::Replacer.new(
        target:,
        with:,
        roll:
      )
    end

    def initialize(target:, with:, roll:)
      @target = ReplacerTarget.for(target, roll:)
      @with   = ReplacerValue.for(with, roll:)
      @roll   = roll
    end

    def filter
      Randsum::Roll.new(
        die: roll.die,
        quantity: roll.quantity,
        result:
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
