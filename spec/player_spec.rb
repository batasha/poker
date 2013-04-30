require "rspec"
require "player"

describe Player do

  subject(:player) { Player.new("Amarillo Slim", 100_000) }

  let(:deck) { Deck.new }

  its(:name) { should == "Amarillo Slim" }
  its(:bankroll) { should == 100_000 }

  before { player.hand = Hand.new(deck) }

  describe "#pick_discards" do
    it "something about getting input ??????????????"
  end

  describe "#get_new_cards" do
    it "creates hand of correct size" do
      player.get_new_cards(player.hand.cards[0..2], deck)
      player.hand.size.should == 5
    end

    it "returns cards to deck" do
      player.hand.should_receive(:discard).with(player.hand.cards[0..2], deck)
      player.get_new_cards(player.hand.cards[0..2], deck)

    end

    it "gets new cards from deck" do
      player.hand.should_receive(:draw).with(deck, 3)
      player.get_new_cards(player.hand.cards[0..2], deck)
    end
  end

  describe "#choices" do
    it "is made out of magic"
  end


  describe "#raise" do
    it "removes amount from bankroll"
    it "sends bet amount to game pot"
    it "returns amount subtracted from bankroll"
  end


  describe "#check" do
    it ""
  end

  describe "#fold" do
    it "returns cards to deck"
  end


end