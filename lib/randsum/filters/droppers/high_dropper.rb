# frozen_string_literal: true

module Randsum
  class HighDropper < Dropper
    def ordered
      roll.result.sort { |a, b| a <=> b }
    end
  end
end
