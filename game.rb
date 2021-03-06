require_relative 'cardDeckClass'
require_relative 'playerClass'

# global variables

# creating person and computer
$person = Player.new '', [], 100
p $person.accept_name
p $person

$computer = Player.new 'Computer', [], 10000

# creating game deck
$game_deck = Deck.new [],[2,3,4,5,6,7,8,9,10,'J','Q','K','A']

$game_deck.make_suit "Clubs"
$game_deck.make_suit "Diamonds"
$game_deck.make_suit "Hearts"
$game_deck.make_suit "Spades"

$game_deck.shuffle



# create the deck and the players

class Game

  def deal_cards
     $person.hand.push($game_deck.deck.first(2))
     $computer.hand.push($game_deck.deck.last(2))
    p $person.hand[0]
    # p $player_hand = $person.hand[0][0] + $person.hand[1][@num].to_i
    # p $computer_hand = $computer.hand[0][@num].to_i + $computer.hand[1][@num].to_i
  end

end

game = Game.new
# game.create_players
# game.create_deck
game.deal_cards
# deal the cards to the player
# compare the hands and add the winnings (always 10 dollars)
#