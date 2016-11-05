require 'spec_helper'

describe Randsum::Roll do
  let(:sides)    { 20 }
  let(:die)      { Randsum::Die.new(sides)}
  let(:quantity) { 4 }
  let(:result)   { [20, 19, 4, 12] }
  let(:rolls)   { result }
  let(:roll)     { Randsum::Roll.new(die: die, quantity: quantity, result: result) }

  let(:total) { rolls.inject(:+) }
  let(:inspect) {"You rolled #{rolls.count} #{die}, and got #{total}. (Rolls: #{result})"}

  describe "inspect" do
    it "returns the correctly formatted string" do
      expect("#{roll.inspect}").to eq inspect
    end
  end

  describe "to_s" do
    it "returns the correctly formatted string" do
      expect("#{roll}").to eq inspect
    end
  end

  describe "#to_i" do
    it 'returns the total of the array of dice' do
      expect(roll.to_i).to eq total
    end
  end

  describe "#total" do
    it 'returns the total of the array of dice' do
      expect(roll.total).to eq total
    end
  end

  describe "drop logic" do
    let(:rolls)  { [2, 6, 5] }
    let(:roll)   { Randsum::Roll.new(result: rolls, die: die, quantity: 3) }

    describe "#drop" do
      let(:num) { 2 }
      let(:dropped_result) { roll.drop(quantity: num, extremity: extremity)}

      describe "given a 'lowest' extremity" do
        let(:extremity) { :lowest }

        it "removes n lowest dice values" do
          expect(dropped_result.rolls).to match_array [6]
          expect(dropped_result.total).to eq 6
        end

        it "returns a Roll" do
          expect(dropped_result).to be_a Randsum::Roll
        end
      end
      describe "given a 'highest' extremity" do
        let(:extremity) { :highest }

        it "removes n highest dice values" do
          expect(dropped_result.rolls).to match_array [2]
          expect(dropped_result.total).to eq 2
        end

        it "returns a Roll" do
          expect(dropped_result).to be_a Randsum::Roll
        end
      end
    end

    describe "#drop_highest" do
      describe "with an argument n" do
        let(:num) { 2 }
        let(:dropped_result) { roll.drop_highest(num)}
        it "removes n highest dice values" do
          expect(dropped_result.rolls).to match_array [2]
          expect(dropped_result.total).to eq 2
        end

        it "returns a Roll" do
          expect(dropped_result).to be_a Randsum::Roll
        end
      end

      describe "with no argument" do
        let(:dropped_result) { roll.drop_highest }
        it "removes the highest dice value" do
          expect(dropped_result.rolls).to match_array [2, 5]
          expect(dropped_result.total).to eq 7
        end

        it "returns a Roll" do
          expect(dropped_result).to be_a Randsum::Roll
        end
      end
    end

    describe "#drop_lowest" do
      describe "with an argument n" do
        let(:num) { 2 }
        let(:dropped_result) { roll.drop_lowest(num)}
        it "removes n lowest dice values" do
          expect(dropped_result.rolls).to match_array [6]
          expect(dropped_result.total).to eq 6
        end

        it "returns a Roll" do
          expect(roll.drop_lowest(num)).to be_a Randsum::Roll
        end
      end

      describe "with no argument" do
        let(:dropped_result) { roll.drop_lowest }
        it "removes the lowest dice value" do
          expect(dropped_result.rolls).to match_array [5, 6]
          expect(dropped_result.total).to eq 11
        end

        it "returns a Roll" do
          expect(roll.drop_lowest).to be_a Randsum::Roll
        end
      end
    end

  end


  describe "#rolls" do
    it 'returns the array of dice roll results' do
      expect(roll.rolls).to eq rolls
    end
  end

  describe "#length " do
    let(:quantity) { rolls.count }

    it 'returns the number of dice rolled' do
      expect(roll.length).to eq quantity
    end
  end

  describe "#count " do
    let(:quantity) { rolls.count }

    it 'returns the number of dice rolled' do
      expect(roll.count).to eq quantity
    end
  end

  describe "#quantity" do
    let(:puantity) { rolls.count }

    it 'returns the number of dice rolled' do
      expect(roll.quantity).to eq quantity
    end
  end

  describe "#sides" do
    it 'returns the correct number of sides' do
      expect(roll.sides).to eq sides
    end
  end

  describe "#die" do
    it 'returns a die object with the correct sides' do
      expect(roll.die).to be_a Randsum::Die
      expect(roll.die.sides).to eq sides
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
