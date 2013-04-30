require "rspec"
require "hand"

describe Hand do

  describe "::draw_hand(deck)" do
    deck = Deck.new

    it "calls #take on deck" do
      deck.should_receive(:take).with(5)
      Hand.draw_hand(deck)
    end

    it "creates a five-card hand" do
      Hand.draw_hand(deck).size.should == 5
    end

  end

  describe "::tie_breaker" do

    it "ranks flushes correctly" do
      deck = Deck.new
      flush1 = Hand.new(Deck.new(deck.cards[0..4]))
      flush2 = Hand.new(Deck.new(deck.cards[16..20]))
      flush3 = Hand.new(Deck.new(deck.cards[40..44]))
      flushes = [flush1, flush2, flush3]

      Hand.tie_breaker(flushes).should == flush2
    end


    it "rank straights correctly" do
      deck = Deck.new
      straight1 = Hand.new(Deck.new(deck.cards[0..4]))
      straight2 = Hand.new(Deck.new(deck.cards[16..20]))
      straight3 = Hand.new(Deck.new(deck.cards[40..44]))
      straights = [straight1, straight2, straight3]

      Hand.tie_breaker(straights).should == straight2
    end


    it "ranks 3 of a kind correctly" do
      deck1 = [Card.new(:clubs, 2), Card.new(:clubs, 12), Card.new(:spades, 12),
               Card.new(:hearts, 12), Card.new(:diamonds, 7)]
      deck2 = [Card.new(:clubs, 7), Card.new(:clubs, 7), Card.new(:spades, 12),
               Card.new(:hearts, 10), Card.new(:diamonds, 7)]
      hands = [Hand.new(deck1), Hand.new(deck2)]

      Hand.tie_breaker(hands).should == hands[0]
    end


    it "ranks full houses correctly" do
      deck1 = [Card.new(:clubs, 9), Card.new(:clubs, 12), Card.new(:spades, 12),
               Card.new(:hearts, 9), Card.new(:diamonds, 9)]
      deck2 = [Card.new(:clubs, 11), Card.new(:clubs, 11), Card.new(:spades, 7),
               Card.new(:hearts, 11), Card.new(:diamonds, 7)]
      hands = [Hand.new(deck1), Hand.new(deck2)]

      Hand.tie_breaker(hands).should == hands[1]
    end


  end

  describe "#initialize(deck)" do
    it "creates a five-card hand by default" do
      Hand.new(Deck.new).size.should == 5
    end
  end

  describe "#discard(cards, deck)" do
    deck = Deck.new
    hand = Hand.new(deck)
    to_remove = hand.cards[0..2]

    it "removes cards from hand" do
      hand.discard( to_remove, deck)
      hand.size.should == 2
    end

    it "returns cards to the bottom of the deck" do
      deck.cards[-3..-1].should == to_remove
    end

    it "raises too many cards if more than 3"
  end

  describe "#draw(deck, n)" do
    deck = Deck.new
    hand = Hand.new(deck)

    # it "takes an argument of type Deck and Fixnum" do
    #   hand.should_receive(:draw).with(an_instance_of(Deck), an_instance_of(Fixnum))
    #   hand.draw(deck, 3)
    # end

    it "calls #take on deck" do
      deck.should_receive(:take).and_call_original
      hand.draw(deck, 3)
    end

    it "adds cards to hand" do
      hand.size.should == 8
    end

  end

  context "Rank Helper Methods:" do
    let(:bad_hand) { Hand.new( Deck.new( [Card.new(:clubs, 9), Card.new(:clubs, 11),
         Card.new(:spades, 2), Card.new(:hearts, 4), Card.new(:diamonds, 7)] ) ) }

    describe "#str_flush?" do
      deck1 = [Card.new(:diamonds, 9), Card.new(:diamonds, 11), Card.new(:diamonds, 10),
               Card.new(:diamonds, 8), Card.new(:diamonds, 7)]

      it "identifies a straight flush" do
        Hand.new(deck1).should be_str_flush
      end
      it "returns false if not found" do
        bad_hand.should_not be_str_flush
      end
    end

    describe "#quad?" do
      deck1 = [Card.new(:clubs, 9), Card.new(:clubs, 11), Card.new(:spades, 11),
             Card.new(:hearts, 11), Card.new(:diamonds, 11)]
      it "identifies a quad" do
        Hand.new(deck1).should be_quad
      end
      it "returns false if not found" do
        bad_hand.should_not be_quad
      end
    end

    describe "#full_house?"do
      deck1 = [Card.new(:clubs, 9), Card.new(:clubs, 11), Card.new(:spades, 11),
             Card.new(:hearts, 11), Card.new(:diamonds, 9)]

      it "identifies a full house" do
        Hand.new(deck1).should be_full_house
      end
      it "returns false if not found" do
        bad_hand.should_not be_full_house
      end
    end

    describe "#flush?" do
      deck1 = [Card.new(:clubs, 3), Card.new(:clubs, 11), Card.new(:clubs, 5),
               Card.new(:clubs, 8), Card.new(:clubs, 7)]

      it "identifies a flush" do
        Hand.new(deck1).should be_flush
      end
      it "returns false if not found" do
        bad_hand.should_not be_flush
      end
    end

    describe "#straight?" do
      deck1 = [Card.new(:clubs, 9), Card.new(:clubs, 11), Card.new(:spades, 10),
               Card.new(:hearts, 8), Card.new(:diamonds, 7)]

      it "identifies a straight" do
        Hand.new(deck1).should be_straight
      end
      it "returns false if not found" do
        bad_hand.should_not be_straight
      end
    end

    describe "#trip?" do
      deck1 = [Card.new(:clubs, 9), Card.new(:clubs, 11), Card.new(:spades, 11),
               Card.new(:hearts, 11), Card.new(:diamonds, 7)]

      it "identifies a trip" do
        Hand.new(deck1).should be_trip
      end
      it "returns false if not found" do
        bad_hand.should_not be_trip
      end
    end

    describe "#two_pair?" do
      deck1 = [Card.new(:clubs, 9), Card.new(:clubs, 11), Card.new(:spades, 11),
               Card.new(:hearts, 9), Card.new(:diamonds, 7)]

      it "identifies two pair" do
        Hand.new(deck1).should be_two_pair
      end
      it "returns false if not found" do
        bad_hand.should_not be_two_pair
      end
    end

    describe "#pair?" do
      deck1 = [Card.new(:clubs, 9), Card.new(:clubs, 11), Card.new(:spades, 2),
               Card.new(:hearts, 9), Card.new(:diamonds, 7)]

      it "identifies a pair" do
        Hand.new(deck1).should be_pair
      end

      it "returns false if not found" do
        bad_hand.should_not be_pair
      end

    end
  end

  describe "#set_rank" do

    it "sets straight flush rank" do
      deck1 = [Card.new(:diamonds, 9), Card.new(:diamonds, 11), Card.new(:diamonds, 10),
               Card.new(:diamonds, 8), Card.new(:diamonds, 7)]
      hand = Hand.new(deck1)
      hand.set_rank
      hand.rank.should == Hand::HAND_RANKINGS.index(:str_flush)
    end

    it "sets pair rank" do
      deck1 = [Card.new(:clubs, 9), Card.new(:clubs, 11), Card.new(:spades, 2),
               Card.new(:hearts, 9), Card.new(:diamonds, 7)]
      hand = Hand.new(deck1)
      hand.set_rank
      hand.rank.should == Hand::HAND_RANKINGS.index(:pair)
    end


    it "sets high card rank" do
      deck1 = [Card.new(:clubs, 3), Card.new(:clubs, 11), Card.new(:spades, 2),
               Card.new(:hearts, 9), Card.new(:diamonds, 7)]
      hand = Hand.new(deck1)
      hand.set_rank
      hand.rank.should == Hand::HAND_RANKINGS.index(:high_card)
    end

  end


end