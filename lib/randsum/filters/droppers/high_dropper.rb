# frozen_string_literal: true

module Randsum
  # A HighDropper is a filter that removes the lowest rolls from a set of rolls.
  class HighDropper < Dropper
    def ordered
      roll.result.sort { |a, b| a <=> b }
    end
  end
end
