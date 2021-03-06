require_relative 'cardDeckClass'
require_relative 'playerClass'

# global variables

# creating person and computer
$person = Player.new '', [], 100
p $person.accept_name
# p $person

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

  p  $person_hand = $person.hand[0][0].num + $person.hand[0][0].num
  p  $computer_hand = $computer.hand[0][0].num + $computer.hand[0][0].num
  end
  
  def check_values
    if $person_hand > $computer_hand
      $person.bankroll += 10
      $computer.bankroll -= 10
      p "#{$person.name} wins!"
      p "Player has $#{$person.bankroll}"
      p "Computer has $#{$computer.bankroll}"
    elsif $computer_hand > $person_hand
      $person.bankroll -= 10
      $computer.bankroll += 10
      p 'Computer Wins!'
      p "Player has $#{$person.bankroll}"
      p "Computer has $#{$computer.bankroll}"
    else
      p 'It was a tie!'
    end

    


end




end

 

game = Game.new
# game.create_players
# game.create_deck
game.deal_cards
game.check_values
# deal the cards to the player
# compare the hands and add the winnings (always 10 dollars)
#