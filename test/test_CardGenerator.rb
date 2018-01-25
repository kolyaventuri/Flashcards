require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/CardGenerator'
require './lib/Card'

class CardGeneratorTest < Minitest::Test

  def test_card_generator_object_exists
    cardGenerator = CardGenerator.new('cards.txt')
    assert_instance_of CardGenerator, cardGenerator
  end

  def test_card_generator_creates_cards
    cardGenerator = CardGenerator.new('cards.txt')
    assert_instance_of Card, cardGenerator.cards.first
  end

  def test_card_generator_cards_have_questions_and_answers
    cardGenerator = CardGenerator.new('cards.txt')
    card = cardGenerator.cards.first

    assert_instance_of String, card.question
    assert_instance_of String, card.answer
  end

  def test_card_generator_cards_have_been_trimmed
    cardGenerator = CardGenerator.new('cards.txt')
    card = cardGenerator.cards.first

    assert_equal "What is 5 + 5?", card.question
    assert_equal "10", card.answer
  end

  def test_card_generator_accepts_arguments
    if ARGV.length > 0
      cardGenerator = CardGenerator.new(ARGV[0])
      assert_instance_of CardGenerator, cardGenerator
      assert_instance_of Card, cardGenerator.cards.first
    end
  end

end
