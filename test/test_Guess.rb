require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/Card'
require './lib/Guess'

class GuessTest < Minitest::Test

  def test_guess_object_exists
    guess = Guess.new("Guess", nil)
    assert_instance_of Guess, guess
  end

  def test_guess_object_has_response
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Response", card)
    assert_equal "Response", guess.response
  end

  def test_guess_object_has_card_object
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Response", card)
    assert_instance_of Card, guess.card
  end

  def test_guess_object_is_correct
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal true, guess.correct?
  end

  def test_guess_object_is_incorrect
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Anchorage", card)
    assert_equal false, guess.correct?
  end

  def test_guess_object_has_feedback_correct
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Correct!", guess.feedback
  end

  def test_guess_object_has_feedback_incorrect
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Anchorage", card)
    assert_equal "Incorrect.", guess.feedback
  end

end
