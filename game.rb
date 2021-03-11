require_relative 'cardDeckClass'
require_relative 'playerClass'

# global variables

# creating person and computer
$person = Player.new '', [], 100
p $person.accept_name


$computer = Player.new 'Computer', [], 10000

# creating game deck
$game_deck = Deck.new [],[2,3,4,5,6,7,8,9,10,'J','Q','K','A']

$game_deck.make_suit "Clubs"
$game_deck.make_suit "Diamonds"
$game_deck.make_suit "Hearts"
$game_deck.make_suit "Spades"

$game_deck.shuffle

$player_bet = 10

# create the deck and the players

  class Game

  def deal_cards
        $game_deck.deck.shuffle
        $person.hand.push($game_deck.deck.sample(2))
        $computer.hand.push($game_deck.deck.sample(2))
        
        $person_hand = $person.hand[0][0].num + $person.hand[0][1].num
        $computer_hand = $computer.hand[0][0].num + $computer.hand[0][1].num

        p "#{$person.name}'s hand is "+ $person.hand[0][0].name.to_s + " & " + $person.hand[0][1].name.to_s + ". The sum of these cards is " + $person_hand.to_s
      
        p "Computer's hand is "+ $computer.hand[0][0].name.to_s + " & " + $computer.hand[0][1].name.to_s  + ". The sum of these cards is " + $computer_hand.to_s 
    end

  def check_values
    if $person_hand > $computer_hand
      $person.bankroll += $player_bet
      $computer.bankroll -= $player_bet
      p "#{$person.name} wins!"
      p "#{$person.name} has $#{$person.bankroll}"
      p "Computer has $#{$computer.bankroll}"
    elsif $computer_hand > $person_hand
      $person.bankroll -= $player_bet
      $computer.bankroll += $player_bet
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
    p "Would you like to play more? Your default bet is now $#{$player_bet}, d = deal / q = quit / c = check bankroll / b = change bet"
    answer = gets.chomp.downcase

      if answer == 'd'
        $person.hand.clear()
        $computer.hand.clear()
        self.deal_cards
        self.check_values
      elsif answer == 'q'
        p "Good Game!! Have a Good One"
      elsif answer == 'c'
        p "Bankroll: $" + $person.bankroll.to_s
        self.play_again
      elsif answer == 'b'
        p "How much do you want to bet?"
        $player_bet = gets.chomp.to_i
          if $player_bet < 10 
            p "Invalid bet automatically betting $10"
            $player_bet = 10
            self.play_again
          else
            self.play_again
          end
      else 
        self.play_again
      end
  end
end


end 

game = Game.new

game.deal_cards
game.check_values
