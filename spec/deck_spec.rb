require "rspec"
require "deck"

describe Deck do

  describe "::all_cards" do
    subject(:cards) {Deck.all_cards}

    its(:size) { should == 52 }
    it "is composed of card objects" do
      cards.all? {|card| card.class.should == Card}
    end

    it "all cards are unique" do
      cards.uniq.size.should == 52
    end
  end

  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "initializes with a full deck by default"
    it "can be initialized with an array of cards"
  end

  describe "#shuffle!" do
    it "shuffles the deck"
  end

  describe "#take(n)" do
    it "removes n cards from the top of the deck"
  end

  describe "#return_cards(cards)" do
    it "returns cards to the bottom of the deck"
  end

end