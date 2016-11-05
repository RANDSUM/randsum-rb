require 'pry'
module Randsum
  class Roll
    attr_reader :die, :quantity, :sides, :result, :total

    alias_method :length, :quantity
    alias_method :count, :quantity
    alias_method :rolls, :result

    def initialize(die:, quantity:, result: nil)
      @die = die
      @quantity = quantity
      @sides = die.sides
      @result = result || roll!
    end

    def to_s
      "You rolled #{count} #{die}, and got #{total}. (Rolls: #{result})"
    end
    alias_method :inspect, :to_s

    def total
      @total ||= result.inject(:+)
    end
    alias_method :to_i, :total

    def drop(quantity:,extremity:)
      return new_roll_with(
      result: Dropper.dropper_for(
          quantity: quantity,
          extremity: extremity,
          rolls: result
        ).filter
      )
    end

    def drop_lowest(quantity = 1)
      drop(quantity: quantity, extremity: :lowest)
    end

    def drop_highest(quantity = 1)
      drop(quantity: quantity, extremity: :highest)
    end

    private

    def new_roll_with(result: nil)
      return Roll.new(
        die: die,
        quantity: quantity,
        result: result
      )
    end

    def roll!
      (1..quantity).map { die.simple_roll }
    end
  end
end
