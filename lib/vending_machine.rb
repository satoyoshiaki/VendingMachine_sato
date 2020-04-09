class VendingMachine
  AVAILABLE_MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @total = 0
    @drink_table = { cola: { price: 120, stock: 5 }}
  end

  def insert(money)
    if VendingMachine::AVAILABLE_MONEY.include?(money)
      @total += money
    else
      puts "#{money}円は使えません"
    end
  end

  def refund
    if @total == 0
      puts "払い戻すお金はありません"
      else
      puts "#{@total}円を払い戻し"
      @total = 0
    end
  end

  def drink_stock
    if @drink_table[:cola][:stock] == 0
      puts "コーラは売り切れです"
    else
      puts "コーラ,価格:1本#{@drink_table[:cola][:price]}円,在庫:#{@drink_table[:cola][:stock]}本"
  end
end