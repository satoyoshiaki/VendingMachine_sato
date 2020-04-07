class VendingMachine
  def initialize
    @total = 0
  end
  def insert(money)
    @total += money
  end
end