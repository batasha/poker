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
      Card.values.should == [:deuce, :three, :four, :five, :six, :seven,
                             :eight, :nine, :ten, :jack, :queen, :king,
                             :ace]
    end
  end


  subject(:card) {Card.new(:clubs, :seven)}

  its(:suit) { should == :clubs }
  its(:value) { should == :seven }

  describe "#==" do
    it "returns true if cards' value and suit match" do
      (card == Card.new(:clubs, :seven)).should be_true
    end
    it "returns false if suits don't match" do
      (card == Card.new(:hearts, :seven)).should be_false
    end
    it "returns false if values don't match" do
      (card == Card.new(:clubs, :ten)).should be_false
    end
  end

  describe "#to_s" do
    it "returns a string representation of a card" do
      card.to_s.should == "7♣"
    end
  end
end