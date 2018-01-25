class Guess
  attr_reader :response,
              :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    @response.downcase == @card.answer.downcase # Don't need to be case sensitive
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end

end
