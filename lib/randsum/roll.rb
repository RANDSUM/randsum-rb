require 'pry'
module Randsum
  class Roll
    attr_reader :die, :quantity, :sides, :result

    def initialize(die:, quantity:, result: nil)
      @die = die
      @quantity = quantity
      @sides = die.sides
      @result = result || roll!
    end

    def inspect
      to_s
    end

    def length
      quantity
    end

    def count
      quantity
    end

    def to_s
      "You rolled #{quantity} #{die}, and got #{total}. (Rolls: #{result})"
    end

    def to_i
      total
    end

    def rolls
      result
    end

    def total
      @_total ||= rolls.inject(:+)
    end

    def drop_lowest(quantity = 1)
      drop(quantity: quantity, extremity: :lowest)
    end

    def drop_highest(quantity = 1)
      drop(quantity: quantity, extremity: :highest)
    end

    def drop(quantity:,extremity:)
      return new_roll_with(
      result: Dropper.dropper_for(
          quantity: quantity,
          extremity: extremity,
          rolls: result
        ).filter
      )
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
