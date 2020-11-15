class Dice
  attr_reader :sides

  def initialize(sides)
    @sides = sides
  end

  def roll(number_of_rolls = 1)
    total = 0
    number_of_rolls.times do
      total += rand(1..sides)
    end
    total
  end
end
  
