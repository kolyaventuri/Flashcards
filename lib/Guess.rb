class Guess
  attr_reader :response,
              :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    @response.downcase == @card.answer.downcase
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end

end
