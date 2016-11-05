require "randsum/version"
require "randsum/metadata"
require "randsum/filters/filter"
require "randsum/filters/droppers/dropper"
require "randsum/filters/droppers/high_dropper"
require "randsum/filters/droppers/low_dropper"
require "randsum/roll"
require "randsum/die"

module Randsum
  D2 = Die.new(2)
  D3 = Die.new(3)
  D4 = Die.new(4)
  D6 = Die.new(6)
  D8 = Die.new(8)
  D10= Die.new(10)
  D12 = Die.new(12)
  D20 = Die.new(20)

end
