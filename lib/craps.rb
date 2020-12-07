module Lib
  class Craps
    require_relative "dice"

    attr_reader :win_state, :rolls
    def initialize
      @rolls = []
    end

    def start_game
      # Reset win state whenever we start a new game
      self.win_state = nil

      roll = roll_2d6
      if seven_eleven?(roll)
        self.win_state = true
      elsif craps?(roll)
        self.win_state = false
      else
        point = roll
        loop do
          roll = roll_2d6
          if roll == point
            self.win_state = true
          elsif roll == 7
            self.win_state = false
          end
          break unless win_state.nil?
        end
      end
      win_state
    end

    private

    attr_writer :win_state, :rolls

    def roll_2d6
      dice = Dice.new
      total = dice.roll(2)
      rolls << dice.last_roll
      total
    end

    def seven_eleven?(roll)
      roll == 7 || roll == 11
    end

    def craps?(roll)
      roll == 2 || roll == 3 || roll == 12
    end
  end
end
