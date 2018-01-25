require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/Card'

class CardTest < Minitest::Test

  def test_card_object_exists
    card = Card.new("Question", "Answer")
    assert_instance_of Card, card
  end

  def test_card_contains_question
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "What is the capital of Alaska?", card.question
  end

  def test_card_contains_answer
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "Juneau", card.answer
  end

end
