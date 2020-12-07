#!usr/bin/env ruby

require_relative "helpers/main_helper"
require_relative "lib/craps"
require_relative "lib/capital"

include Lib
include MainHelper

welcome

# 100 USD is starting capital
STARTING_CAPITAL = 100

capital = Capital.new(STARTING_CAPITAL)

display_capital(capital)

loop do
  begin

  bet = enter_bet

  raise(BetError, "Your bet can't go over $#{capital.funds}.") if bet > capital.funds
  raise(BetError, "Your bet has to be postive.") unless bet.positive?
  rescue BetError => e
    puts e.message
    retry
  rescue ArgumentError
    puts "Your bet has to be a number."
    retry
end

  game = Craps.new
  game.start_game

  pause
  display_rolls(game)
  process_game_result(game, capital, bet)

  display_capital(capital)

  unless capital.funds.positive?
    puts "You don't have enough money."
    break
  end

  choice = play_again_prompt
  break unless choice == "Y"
end
