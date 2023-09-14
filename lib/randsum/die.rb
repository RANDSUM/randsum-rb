# frozen_string_literal: true

require 'securerandom'

module Randsum
  # A die is an object that can be `.roll`ed to produce a random number.
  class Die
    ZERO_INDEX_FIXER = 1
    attr_accessor :sides, :randomizer

    def initialize(sides, randomizer: SecureRandom)
      @sides = sides
      @randomizer = randomizer
    end

    def roll(quantity = 1)
      Randsum::Roll.new(
        quantity:,
        die: self
      )
    end

    def to_s
      "d#{sides}"
    end

    def simple_roll
      randomizer.random_number(sides).to_i + ZERO_INDEX_FIXER
    end
  end
end
