require_relative 'cardDeckClass'
require_relative 'playerClass'
# person = Player.new '', [], 100

# create the deck and the players

class Game

  def create_players
    person = Player.new '', [], 100
    p person.accept_name
    p person

    computer = Player.new 'Computer', [], 10000
  end

  def create_deck

    game_deck = Deck.new [],[2,3,4,5,6,7,8,9,10,'J','Q','K','A']

    game_deck.make_suit "Clubs"
    game_deck.make_suit "Diamonds"
    game_deck.make_suit "Hearts"
    game_deck.make_suit "Spades"

    game_deck.shuffle
  end

end

game = Game.new
game.create_players


# deal the cards to the player
# compare the hands and add the winnings (always 10 dollars)
#