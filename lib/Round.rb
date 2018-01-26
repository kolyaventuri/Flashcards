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
    guess = Guess.new(response, current_card) # Create guess
    if(guess.correct?)
      @number_correct += 1 # Increment if correct
    end
    @current_index += 1
    guesses.push(guess) # Add to guesses array
    guess
  end

  def current_card
    @deck.cards[@current_index]
  end

  def percent_correct
    (@number_correct / @deck.cards.length.to_f) * 100
  end

  def start
    puts "Welcome! You're playing with #{@deck.cards.length} cards."
    puts "-------------------------------------------------"

    until(@current_index == @deck.cards.length)
      ask_question
    end

    save_results
    puts "****** Game over! ******"
    puts "You had #{@number_correct} out of #{@deck.cards.length} for a score of #{percent_correct}%"

  end

  def ask_question(skip_print_card_num=false)
    if !skip_print_card_num then
      puts "This is card number #{@current_index + 1} of #{@deck.cards.length}"
    end

    card = current_card # Get the card
    puts "Question: #{card.question}" # Ask question

    answer = $stdin.gets.chomp # Get answer
    if answer.downcase.strip == "hint" then
      puts get_hint
      ask_question(true)
    else
      response = record_guess(answer) # Make guess
      puts response.feedback
    end
  end

  def get_hint
    card = current_card

    if card.hint?
      card.hint
    else
      "There's no hint available."
    end
  end

  def generate_results
    results = ""

    @guesses.each.with_index do |guess, index|
      results += "#{index + 1})\n"
      results += "\tQuestion: \"#{guess.card.question}\"\n"
      results += "\tYou answered: \"#{guess.response}\"\n"
      results += "\tThe correct answer was: \"#{guess.card.answer}\"\n"
      results += "\tYour answer was: #{guess.feedback}"
      if(index < @guesses.length - 1)
        results += "\n"
      end
    end

    results
  end

  def save_results
    saveFilename = Time.now.strftime("results-%Y-%m-%d-%I:%M%P.txt")
    IO.write(saveFilename, generate_results)
    saveFilename
  end
end
