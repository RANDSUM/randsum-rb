# frozen_string_literal: true

module Randsum
  # A LowDropper is a filter that removes the lowest rolls from a set of rolls.
  class LowDropper < Dropper
    def ordered
      roll.result.sort { |a, b| b <=> a }
    end
  end
end
