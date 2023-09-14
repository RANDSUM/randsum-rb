# frozen_string_literal: true

module Randsum
  # A ReplacerTargetAll is a filter that replaces all rolls with the result of the roll.
  class ReplacerTargetAll < ReplacerTarget
    def match
      roll.result
    end
  end
end
