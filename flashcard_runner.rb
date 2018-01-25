require "./lib/Deck"
require "./lib/Round"
require "./lib/CardGenerator"

cards = CardGenerator.new(ARGV[0] || "cards.txt").cards

deck = Deck.new(cards) # Create the deck

round = Round.new(deck) # New round

round.start # Start the game
