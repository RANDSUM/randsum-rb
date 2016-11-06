module Randsum
  class ReplacerTargetAll < ReplacerTarget
    def match
      roll.result
    end
  end
end
