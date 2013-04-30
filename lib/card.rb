# -*- coding: utf-8 -*-

class Card

  SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  VALUE_STRINGS = {
    2  => "2",
    3  => "3",
    4  => "4",
    5  => "5",
    6  => "6",
    7  => "7",
    8  => "8",
    9  => "9",
    10 => "10",
    11 => "J",
    12 => "Q",
    13 => "K",
    14 => "A"
  }

  def self.suits
    SUIT_STRINGS.keys
  end

  def self.values
    VALUE_STRINGS.keys
  end

  attr_reader :suit, :value

  def initialize(suit, value)
    @suit, @value = suit, value
  end

  def ==(other_card)
    self.value == other_card.value
  end

  def <=>(other_card)
    self.value <=> other_card.value
  end

  def to_s
    VALUE_STRINGS[@value] + SUIT_STRINGS[@suit]
  end

end