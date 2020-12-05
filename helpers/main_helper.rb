module MainHelper
  class BetError < StandardError
  end

  def welcome
    puts "Welcome to Craps!"
  end

  def display_capital(capital)
    puts "You have $#{capital.funds}."
  end

  def enter_bet
    print "How much are you betting? "
    Float(gets)
  end

  def process_game_result(game, capital, bet)
    game.win_state ? process_win(capital, bet) : process_loss(capital, bet)
  end

  def process_win(capital, bet)
    puts "Congratulations! You won!"
    capital.increase(bet)
  end

  def process_loss(capital, bet)
    puts "Oops, you lost."
    capital.deduct(bet)
  end

  def play_again_prompt
    print "Do you want to play again? "
    gets.upcase[0]
  end
end
