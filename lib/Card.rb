class Card
  attr_reader :question,
              :answer,
              :hint

  def initialize(question, answer, hint=nil)
    @question = question
    @answer = answer
    @hint = hint
  end

  def hint?
    !@hint.nil? # If hint IS nil, there is no hint so return false
  end

end
