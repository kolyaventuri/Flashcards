require "./lib/Card"
require "./lib/Deck"
require "./lib/Round"

cards = [ # Array of cards
  Card.new("What is 5+5?", "10"),
  Card.new("What is Rachel's favorite animal?", "red panda"),
  Card.new("What is Mike's middle name?", "nobody knows"),
  Card.new("What cardboard cutout lives at Turing?", "Justin Bieber")
]

deck = Deck.new(cards) # Create the deck

round = Round.new(deck) # New round

round.start # Start the game
