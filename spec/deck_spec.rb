require "rspec"
require "deck"

describe Deck do

  describe "::all_cards" do
    it "returns an array of 52 Card objects"
    it "all cards are unique"
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