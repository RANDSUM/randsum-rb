# frozen_string_literal: true

module Randsum
  class LowDropper < Dropper
    def ordered
      roll.result.sort { |a, b| b <=> a }
    end
  end
end
