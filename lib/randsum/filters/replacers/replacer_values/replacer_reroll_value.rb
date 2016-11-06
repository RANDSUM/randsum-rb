module Randsum
  class ReplacerRerollValue < ReplacerValue
    def transform(match)
      match.map { |r| roll.die.simple_roll }
    end
  end
end
