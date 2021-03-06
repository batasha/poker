require_relative "card"

class Deck

  def self.all_cards
    cards = []

    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end
    end

    cards
  end

  attr_reader :cards

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def size
    @cards.size
  end

  def shuffle!
    @cards.shuffle!
    self
  end

  def take(n)
    @cards.shift(n)
  end

  def return_cards(cards)
    @cards += cards
    self
  end
end