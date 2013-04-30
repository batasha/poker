# -*- coding: utf-8 -*-

require "rspec"
require "card"


describe Card do
  describe "::suits" do
    it "returns an array of all four suits" do
      Card.suits.should == [:clubs, :diamonds, :hearts, :spades]
    end
  end

  describe "::values" do
    it "returns an array of all card values" do
      Card.values.should == (2..14).to_a
    end
  end


  subject(:card) {Card.new(:clubs, 7)}

  its(:suit) { should == :clubs }
  its(:value) { should == 7 }

  describe "#==" do
    it "returns true if cards' values match" do
      (card == Card.new(:clubs, 7)).should be_true
    end
    it "returns false if values don't match" do
      (card == Card.new(:clubs, 10)).should be_false
    end
  end

  describe "#to_s" do
    it "returns a string representation of a card" do
      card.to_s.should == "7♣"
    end
  end
end