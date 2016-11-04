require 'securerandom'

module Randsum
  class Die
    ZERO_INDEX_FIXER = 1
    attr_accessor :sides, :randomizer

    def initialize(sides, randomizer: SecureRandom)
      @sides = sides
      @randomizer = randomizer
    end

    def roll(quantity = 1)
      Randsum::RollReport.new(
        roll_for(quantit  y)
      )
    end

    def simple_roll
      randomizer.random_number(sides).to_i + ZERO_INDEX_FIXER
    end

    private

    def roll_for(quantity)
        Randsum::Roll.new(
          quantity: quantity,
          die: self
        )
    end

  end
end