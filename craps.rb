#!usr/bin/env ruby

require_relative "lib/craps"
require_relative "lib/capital"

class BetError < StandardError
end

include Lib

puts "Welcome to Craps!"

# 100 USD is starting capital
STARTING_CAPITAL = 100

capital = Capital.new(STARTING_CAPITAL)

puts "You have an initial $#{capital.funds}."

loop do
  begin
  print "How much are you betting? "
  bet = Float(gets)

  raise(BetError, "Your bet can't go over $#{capital.funds}.") if bet > capital.funds
  raise(BetError, "Your bet has to be postive.") unless bet.positive?
  rescue BetError => e
    puts e.message
    retry
  rescue ArgumentError
    puts "Your bet has to be a number."
    retry
end

  craps = Craps.new
  craps.start_game

  if craps.win_state
    puts "Congratulations! You won!"
    capital.increase(bet)
  else
    puts "Oops, you lost."
    capital.deduct(bet)
  end

  puts "You have $#{capital.funds}."
  print "Do you want to play again? "
  choice = gets.upcase[0]
  break unless choice == "Y"
end
