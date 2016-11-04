require 'spec_helper'

describe Randsum::Roll do
  let(:die)      { Randsum::D20 }
  let(:quantity) { 4 }
  let(:result)   { nil }
  let(:roll)     { Randsum::Roll.new(die: die, quantity: quantity, result: result)}

  describe "drop" do
    it "returns a new Randsum::Roll" do
      expect(roll.drop(quantity: 1, extremity: :highest)).to be_a Randsum::Roll
    end
  end

  describe "to_s" do
    it "returns the formatted string" do
      expect("#{roll}").to eq "Rolls: #{roll.result}"
    end
  end

  describe  "new" do
    describe "with a result:" do
      let(:result) { [20, 20, 20, 20] }
      it "returns a Roll with the given result." do
        expect(roll.result).to equal result
      end
    end

    describe "with no result:" do
      let(:result) { nil }
      it "returns an array of {quantity} integers" do
        expect(roll.result.count).to equal quantity
      end

    end

  end

end
