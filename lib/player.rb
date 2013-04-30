class Player

  attr_reader :name, :bankroll
  attr_accessor :hand

  def initialize(name, bankroll)
    @name = name
    @bankroll = bankroll
    @hand = nil
  end

  def pick_discards
    puts @hand.cards.to_s
    puts "Enter indexes to discard, seperated by commas"
    indices = gets.chomp.split(",").map(&:to_i)

    cards = indices.map { |i| @hand.cards[i] }
  end

  def get_new_cards(old_cards, deck)
    @hand.discard(old_cards, deck)
    @hand.draw(deck, old_cards.size)

  end


end