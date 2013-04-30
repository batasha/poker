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

  cards =  [Card.new(:hearts, :ace), Card.new(:spades, :three),
            Card.new(:clubs, :jack), Card.new(:diamonds, :deuce)]

  describe "#initialize" do

    its(:size) {should == 52}



    it "can be initialized with an array of cards" do
      Deck.new(cards).cards.should == cards
    end
  end

  describe "#shuffle!" do
    it "shuffles the deck" do
      deck.cards.should_not == Deck.new.shuffle!.cards
    end
  end

  describe "#take(n)" do
    it "removes n cards from the top of the deck" do
      Deck.new(cards.dup).take(3).should == cards[0..2]
    end
  end

  describe "#return_cards(cards)" do
    it "returns cards to the bottom of the deck" do
      Deck.new(cards).return_cards(cards).cards.should == cards + cards
    end
  end

end