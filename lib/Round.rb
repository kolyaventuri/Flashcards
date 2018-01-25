require './lib/Guess'

class Round
  attr_reader :deck,
              :guesses,
              :number_correct

  def initialize(deck)
    @deck = deck
    @current_index = 0
    @guesses = []
    @number_correct = 0
  end

  def record_guess(response)
    guess = Guess.new(response, current_card)
    if(guess.correct?)
      @number_correct += 1
    end
    @current_index += 1
    guesses.push(guess)
    guess
  end

  def current_card
    @deck.cards[@current_index]
  end

  def percent_correct
    (@number_correct / @deck.cards.length.to_f) * 100
  end
end
