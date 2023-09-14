# frozen_string_literal: true

module Randsum
  class ReplacerRerollValue < ReplacerValue
    def transform(match)
      match.map { roll.die.simple_roll }
    end
  end
end
