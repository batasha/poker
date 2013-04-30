require "rspec"
require "hand"

describe Hand do

  describe "::draw_hand(deck)" do
    it "calls #take on deck"
    it "creates a five-card hand"
  end

  describe "#initialize" do
    it "creates a five-card hand by default"

  end

  describe "#discard(cards, deck)" do
    it "removes cards from hand"
    it "returns cards to the bottom of the deck"
  end

  describe "#draw(deck, n)" do
    it "takes an argument of type Fixnum"
    it "calls #take on deck"
    it "adds cards to hand"
  end


  describe "#best_rank" do
    #return symbol of best rank of hand
  end

  describe "#beats?(other_hand)" do
    #return true if you're a winner.
  end

  describe "rank_tie_breaker" do
    # compare hands of same rank
  end

end