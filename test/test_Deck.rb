require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/Card'
require './lib/Deck'

class DeckTest < Minitest::Test

  def setup
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    @card_array = [card_1, card_2, card_3]
  end

  def test_deck_object_exists
    deck = Deck.new(@card_array)
    assert_instance_of Deck, deck
  end

  def test_deck_object_has_cards_array
    deck = Deck.new(@card_array)
    assert_equal @card_array, deck.cards
  end

  def test_deck_cards_array_contains_cards_objects
    deck = Deck.new(@card_array)

    @card_array.each.with_index do |card, index|
      assert_equal card, deck.cards[index]
    end
  end

  def test_deck_cards_array_has_right_number_of_objects
    deck = Deck.new(@card_array)
    assert_equal @card_array.length, deck.cards.length
  end

end
