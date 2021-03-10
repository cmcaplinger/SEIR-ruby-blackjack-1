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
        $game_deck.deck.shuffle
        $game_deck.deck.first(2)
        $game_deck.deck.last(2)
        $person.hand.push($game_deck.deck.sample(2))
        $computer.hand.push($game_deck.deck.sample(2))
        
        $person_hand = $person.hand[0][0].num + $person.hand[0][1].num
        $computer_hand = $computer.hand[0][0].num + $computer.hand[0][1].num

        p "#{$person.name}'s hand is "+ $person.hand[0][0].name.to_s + " & " + $person.hand[0][1].name.to_s + ". The sum of these cards is " + $person_hand.to_s
      # p $game_deck.deck.uniq.length
        p "Computer's hand is "+ $computer.hand[0][0].name.to_s + " & " + $computer.hand[0][1].name.to_s  + ". The sum of these cards is " + $computer_hand.to_s 
    end
  
  def check_values
    if $person_hand > $computer_hand
      $person.bankroll += 10
      $computer.bankroll -= 10
      p "#{$person.name} wins!"
      p "#{$person.name} has $#{$person.bankroll}"
      p "Computer has $#{$computer.bankroll}"
    elsif $computer_hand > $person_hand
      $person.bankroll -= 10
      $computer.bankroll += 10
      p 'Computer Wins!'
      p "#{$person.name} has $#{$person.bankroll}"
      p "Computer has $#{$computer.bankroll}"
    else
      p 'It was a tie!'
    end
    self.play_again
end

def play_again
  if $person.bankroll <= 0 
    p "Game Over, gg!! You have no money"
    
  elsif $computer.bankroll <= 0 
    p "Somehow you beat the computer"

  else 
    p 'Would you like to play more? d = deal / q = quit'
    answer = gets.chomp.downcase

      if answer == 'd'
        $person.hand.clear()
        $computer.hand.clear()
        self.deal_cards
        self.check_values
      elsif answer == 'q'
        p "Good Game!! Have a Good One"
      else 
        self.play_again
      end
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