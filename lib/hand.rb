require_relative "deck"

class Hand

  HAND_RANKINGS = [ :high_card, :pair, :two_pair, :trip, :straight, :flush,
                    :full_house, :quad, :str_flush ]

  def self.draw_hand(deck)
    Hand.new(deck)
  end

  def self.tie_breaker(hands)
    sorted_hands = []

    hands.each do |hand|

      unique = hand.cards.uniq_cards.sort!.reverse!
      non_unique = (hand.cards - unique).sort_by! { |el| hand.cards.count(el) }.reverse
      hand.cards = non_unique + unique
      sorted_hands << hand
    end

    sorted_hands.max
  end

  attr_accessor :cards
  attr_reader :reader

  def initialize(deck)
    @cards = deck.take(5)
    @rank = nil
  end

  def size
    @cards.size
  end

  def discard(cards, deck)
    @cards -= cards
    deck.return_cards(cards)
    self
  end

  def draw(deck, n)
    @cards += deck.take(n)
    self
  end

  def <=>(other_hand)
    self.cards <=> other_hand.cards
  end

  def pair?
    self.cards.any? { |el| self.cards.count(el) == 2 }
  end






end


class Array

  def uniq_cards
    unique = []

    self.each { |el| unique << el unless self.count(el) != 1 }

    unique
  end

end