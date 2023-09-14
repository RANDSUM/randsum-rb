# frozen_string_literal: true

module Randsum
  # A Roll controls a single instance of a set of Dice rolls
  class Roll
    attr_reader :die, :quantity, :sides, :result

    alias length quantity
    alias count quantity
    alias rolls result

    def self.roll(num, die_sides:)
      new(die: Die.new(die_sides), quantity: num)
    end

    def initialize(die:, quantity:, result: nil)
      @die = die
      @quantity = quantity
      @sides = die.sides
      @result = result || roll!
    end

    def to_s
      "You rolled #{count} #{die}, and got #{total}. (Rolls: #{result})"
    end
    alias inspect to_s

    def total
      @total ||= result.inject(:+)
    end
    alias to_i total

    def beats?(check_value)
      total > check_value
    end

    def meets?(meet_value)
      total >= meet_value
    end

    def replace(target, with:)
      Replacer.for(
        target: target,
        with: with,
        roll: self
      ).filter
    end

    def double_all(target)
      Replacer.for(
        target: target,
        with: ReplacerValue::DOUBLE,
        roll: self
      ).filter
    end

    def reroll
      Replacer.for(
        target: ReplacerTarget::ALL,
        with: ReplacerValue::REROLL,
        roll: self
      ).filter
    end

    def drop(quantity:, extremity:)
      Dropper.for(
        quantity: quantity,
        extremity: extremity,
        roll: self
      ).filter
    end

    def drop_lowest(quantity = 1)
      drop(quantity: quantity, extremity: :lowest)
    end

    def drop_highest(quantity = 1)
      drop(quantity: quantity, extremity: :highest)
    end

    private

    def roll!
      (1..quantity).map { die.simple_roll }
    end
  end
end
