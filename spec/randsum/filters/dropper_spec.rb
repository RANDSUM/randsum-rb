require 'spec_helper'

describe Randsum::Dropper do
  let(:die)     { Randsum::Die.new(1) }
  let(:roll)    { Randsum::Roll.new(quantity: 0, die: die, result: [])}
  let(:dropper) { Randsum::Dropper.new(quantity: :foo, roll: roll) }

  describe "#ordered" do
    it 'raises a NotImplementedError' do
      expect{ dropper.ordered }.to raise_error NotImplementedError
    end
  end

  describe "#filter" do
    it 'raises a NotImplementedError' do
      expect{ dropper.filter }.to raise_error NotImplementedError
    end
  end
end
