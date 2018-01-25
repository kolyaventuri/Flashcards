require './lib/Card'

class CardGenerator
  attr_reader :cards
  def initialize(filename)
    exists = File.exist?(filename) # Check if file exists
    if(!exists)
      puts "ERROR: File does not exist."
      print "Please enter a new filename: "
      filename = $stdin.gets.chomp
      initialize(filename) # Try again
    else
      @cards = []
      load_cards(filename)
    end
  end

  def load_cards(filename)
    lines = IO.readlines(filename)
    lines.each do |line|
      line.strip! # Get rid of white space on either end
      inputs = line.split("?,") # Split at the end of the question
      new_card = Card.new(inputs[0] + "?", inputs[1]) # Strip will have removed the ? so we have to add it back on
      @cards.push(new_card)
    end
  end
end
