#### CARD CLASS WHICH LETS ME MAKE EACH CARD AND INIT ITS NUMval FOR FACE CARDS
class Card 
    attr_reader :name, :num, :suit

    def initialize num, suit, name
        @num = num
        @suit = suit
        @name = name
    end

    def num_init 
        case @num
            when "J"
                @num = 10
            when "Q"
                @num = 10
            when "K"
                @num = 10
            when "A"
                @num = 11
            else
                @num = @num
            end
        end
    end


class Deck 
    attr_accessor :deck, :cards

    def initialize deck, cards
        @deck = deck
        @cards = cards
    end

##################### Make the deck 1 suit at a time
    def make_suit this_suit
        13.times {|i, n| n = Card.new(
            @num = @cards[i],
            @suit = this_suit,
            @name = @cards[i].to_s + ' '+ 'of'+ ' ' +  @suit
        )
        n.num_init # call num_init to set value of num for face cards before pushing to deck
        @deck.push n
    }
    end

#print the deck and it's length to check everything
# p $deck
# p $deck.length

## We need to shuffle the deck and deal 

#which means we need a player class with a hand

    def shuffle 
        i = 0
        while i < self.deck.length do 
            decklength = (0...52).to_a;
            x = decklength.sample
            self.deck[x], self.deck[i] = self.deck[i], self.deck[x]
            i = i + 1
        end
    end
end

# making the deck
# game_deck = Deck.new [],[2,3,4,5,6,7,8,9,10,'J','Q','K','A']
# making various suits
# game_deck.make_suit "Clubs"
# game_deck.make_suit "Diamonds"
# game_deck.make_suit "Hearts"
# game_deck.make_suit "Spades"
#
# game_deck.shuffle

# checking that its created
# p game_deck.deck.first
# p game_deck.deck.last
# p game_deck.deck.uniq.length
