# frozen_string_literal: true

require 'spec_helper'

describe Randsum::Die do
  let(:die) { described_class.new(20, randomizer: AlwaysWhatYouGiveIt) }

  let(:desired_result) { quantity * die.sides }

  describe 'to_s' do
    it 'returns a simple desrcription' do
      expect(die.to_s).to eq 'd20'
    end
  end

  describe '#simple_roll' do
    let(:quantity) { 1 }
    let(:roll) { die.simple_roll }

    it 'returns a plausibly random number constrained to the number of sides on the die' do
      expect(roll.to_i).to eq desired_result
    end

    it 'returns a Integer' do
      expect(roll).to be_an Integer
    end
  end

  describe '#roll(n)' do
    let(:quantity) { 3 }
    let(:roll) { die.roll(quantity) }

    it 'returns a plausibly random number constrained to the number of sides on the die' do
      expect(roll.to_i).to eq desired_result
    end

    it 'returns a Randsum::Roll' do
      expect(roll).to be_a Randsum::Roll
    end
  end
end
