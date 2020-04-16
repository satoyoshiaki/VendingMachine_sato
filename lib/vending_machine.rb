require './lib/drink.rb'

class VendingMachine
  AVAILABLE_MONEY = [10, 50, 100, 500, 1000].freeze

  # これで投入合計額、売上金額をメソッドで呼び出せる。
  attr_reader :total,:sale_amount

  def initialize
    @total = 0
    @sale_amount = 0va
    @drink_table = {}
    5.times { store(Drink.cola) }
  end

  # お金投入
  def insert(money)
    if VendingMachine::AVAILABLE_MONEY.include?(money)
      @total += money
    else
      puts "#{money}円は使えません"
    end
  end

  # 払い戻し
  def refund
    if @total == 0
      puts "払い戻すお金はありません"
    else
      puts "#{@total}円を払い戻し"
      @total = 0
    end
  end

  # 飲み物の補充
  def store(drink)
    unless @drink_table.has_key?(drink.name)
      @drink_table[drink.name] = { price: drink.price, drinks: [] }
    end
    @drink_table[drink.name][:drinks] << drink
  end

  # 飲み物の情報
  def stock_info
    @drink_table.map { |name, info| [name, { price: info[:price], stock: info[:drinks].size }] }.to_h
  end

  # 購入可能な飲み物の確認
  def purchase_drink_check
    @drink_table.select { |name,info| info[:price] <= @total && info[:drinks].size > 0 }.keys
  end

  # 購入時：購入希望の飲み物の価格と投入額の計算.
  # trueなら購入可
  def purchase_cost(drink)
    @total >= @drink_table[drink.name][:price]
  end

  # 購入時：飲み物の在庫確認
  # trueなら購入可
  def purchase_drink(drink)
    @drink_table[drink.name][:drinks].size > 0
  end

  # 飲み物の購入
  def purchase(drink)
    if purchase_drink(drink) && purchase_cost(drink)
      drink = @drink_table[drink.name][:drinks].pop
      @sale_amount += drink.price
      @total -= drink.price
      puts "購入した飲み物：#{drink.name}"
      puts "購入金額：#{drink.price}"
      refund
    end
  end
end