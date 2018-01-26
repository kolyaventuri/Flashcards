require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/Round'
require './lib/Card'
require './lib/Deck'
require './lib/Guess'

class RoundTest < Minitest::Test

  def setup
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", "The red planet")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    card_array = [card_1, card_2, card_3]
    @deck = Deck.new(card_array)
  end

  def test_round_object_exists
    round = Round.new(@deck)
    assert_instance_of Round, round
  end

  def test_round_has_deck
    round = Round.new(@deck)
    assert_instance_of Deck, round.deck
    assert_equal @deck, round.deck
  end

  def test_round_has_guesses_array
    round = Round.new(@deck)
    assert_instance_of Array, round.guesses
  end

  def test_round_has_current_card
    round = Round.new(@deck)
    assert_instance_of Card, round.current_card
  end

  def test_round_can_ask_for_hint
    round = Round.new(@deck)
    assert_equal "There's no hint available.", round.get_hint
    round.record_guess("Juneau")
    assert_equal "The red planet", round.get_hint
  end

  def test_round_can_record_guess
    round = Round.new(@deck)
    guess = round.record_guess("Juneau")

    assert_instance_of Guess, guess
    assert_equal 1, round.guesses.count
    assert_instance_of Guess, round.guesses.first
  end

  def test_round_guesses_increment_properly
    round = Round.new(@deck)
    first_card = round.current_card
    guess = round.record_guess("Juneau")

    assert_instance_of Guess, guess
    assert_equal 1, round.guesses.count
    refute_equal first_card, round.current_card

    round.record_guess("Wrong answer")
    assert_equal 2, round.guesses.count
  end

  def test_round_tracks_number_correct_properly
    round = Round.new(@deck)
    guess = round.record_guess("Juneau")

    assert_instance_of Guess, guess
    assert_equal 1, round.number_correct

    round.record_guess("Wrong answer")
    refute_equal 2, round.number_correct

    assert_equal (1.0/3.0) * 100, round.percent_correct
  end

  def test_round_gives_correct_feedback
    round = Round.new(@deck)
    round.record_guess("Juneau")

    assert_equal "Correct!", round.guesses.first.feedback

    round.record_guess("Wrong answer")
    assert_equal "Incorrect.", round.guesses.last.feedback
  end

  def test_round_saves_correctly
    round = Round.new(@deck)

    round.record_guess("Juneau")
    round.record_guess("Left")
    round.record_guess("North west west")

    saveFilename = round.save_results

    saved_file = IO.read(saveFilename)
    expected_result = IO.read("./test/test_save.txt")

    assert_equal saved_file, expected_result

    File.unlink(saveFilename)
  end

end
