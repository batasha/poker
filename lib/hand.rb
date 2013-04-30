class Hand

  HAND_RANKINGS = [ :high_card, :pair, :three, :straight, :flush,
                    :str_flush ]

  def self.draw_hand(deck)
    Hand.new(deck)
  end

  attr_reader :cards

  def initialize(deck)
    @cards = deck.take(5)
  end

  def size
    @cards.size
  end

end
