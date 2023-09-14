# frozen_string_literal: true

module Randsum
  class ReplacerDoubleValue < ReplacerValue
    def transform(match)
      match.map { |r| r * 2 }
    end
  end
end
