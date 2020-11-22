class Capital
  def initialize(funds = 0)
    @funds_in_cents = (funds * 100).to_i
  end

  def add(amount)
    self.funds_in_cents += (amount * 100).to_i
    funds
  end

  def deduct(amount)
    self.funds_in_cents -= (amount * 100).to_i
    funds
  end

  def funds
    funds_in_cents / 100
  end

  private

  attr_accessor :funds_in_cents
end
