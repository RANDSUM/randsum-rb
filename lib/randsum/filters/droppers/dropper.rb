module Randsum
  class Dropper
    attr_reader :quantity, :roll

    def self.for(quantity:, extremity:, roll:)
      Object.const_get(
        "Randsum::#{extremity.to_s.gsub("est","").capitalize}Dropper"
      ).new(quantity: quantity, roll: roll)
    end

    def initialize(quantity:, roll:)
      @quantity = quantity
      @roll = roll
    end

    def filter
      return Randsum::Roll.new(
        die: roll.die,
        quantity: roll.quantity,
        result: result
      )
    end

    def ordered
      raise NotImplementedError
    end

    private

    def result
      ordered.first(remainder)
    end

    def remainder
      roll.length - quantity
    end
  end
end
