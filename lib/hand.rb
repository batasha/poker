require_relative "deck"

class Hand

  HAND_RANKINGS = [:high_card, :pair, :two_pair, :trip, :straight, :flush,
                   :full_house, :quad, :str_flush]

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
  attr_reader :reader, :rank

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

  def two_pair?
    self.cards.select { |el| self.cards.count(el) == 2 }.size == 4
  end

  def trip?
    self.cards.any? { |el| self.cards.count(el) == 3 }
  end

  def straight?
    hand = self.cards.sort
    (hand.size - 1).times do |i|
      return false if hand[i].value + 1 != hand[i+1].value
    end
    true
  end

  def flush?
    self.cards.all? { |el| el.suit == self.cards[0].suit }
  end

  def full_house?
    self.pair? && self.trip?
  end

  def quad?
    self.cards.any? { |el| self.cards.count(el) == 4 }
  end

  def str_flush?
    self.straight? && self.flush?
  end

  def high_card?
  end


  def set_rank

    HAND_RANKINGS.each_with_index do |rank, i|
      rank = (rank.to_s + "?").to_sym
     @rank = i if self.send(rank)
    end

    @rank ||= 0
  end

end


class Array

  def uniq_cards
    unique = []

    self.each { |el| unique << el unless self.count(el) != 1 }

    unique
  end

end