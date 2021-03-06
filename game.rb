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
    p $person.hand.push($game_deck.deck.first(2))
    $computer.hand.push($game_deck.deck.last(2))
    $player_hand = $person.hand[0][0].num + $person.hand[0][1].num
    $computer_hand = $computer.hand[0][0].num + $computer.hand[0][1].num
    p $player_hand
    p $computer_hand
    # p $player_hand = $person.hand[0][0] + $person.hand[1][@num].to_i
    # p $computer_hand = $computer.hand[0][@num].to_i + $computer.hand[1][@num].to_i
  end

  def play
    if $player_hand < 21 && $player_hand > $computer_hand
      player_bankroll_update = $person.bankroll + 10
      computer_bankroll_update = $computer.bankroll - 10
      p `The player has won, you now have #{player_bankroll_update}`
    elsif $computer_hand < 21 && $computer_hand > $player_hand
      player_bankroll_update = $person.bankroll - 10
      computer_bankroll_update = $computer.bankroll + 10
      p `The player has loss, you now have #{player_bankroll_update}`
    end
  end

end

game = Game.new
# game.create_players
# game.create_deck
game.deal_cards
# deal the cards to the player
# compare the hands and add the winnings (always 10 dollars)
#