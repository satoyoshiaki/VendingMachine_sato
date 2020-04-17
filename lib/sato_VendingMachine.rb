class VendingMachine
    #ここにドリンク情報をかく
    def sock_price                                       
        @cola = [120,5]
        @redbull = [200,5]
        @water = [100,5]
    end
    #ここはinfoをよぶと商品情報が出力される
    def info(drink_name)
        sock_price
        if drink_name == "コーラ"
            puts "コーラは#{@cola[0]}円で在庫本数は#{@cola[1]}本です！"
        elsif drink_name == "レッドブル"
            puts "レッドブルは#{@redbull[0]}円で在庫本数は#{@redbull[1]}本です！"
        elsif drink_name == "水"
            puts "水は#{@water[0]}円で在庫本数は#{@water[1]}本です！"
        end
    end
    #金庫
    def bank
        @havmoney = 10000
    end
    #totalの初期値
    def total_money
        @total = 0
    end
      # お金の投入
    def insert(money)
        avilable_money = [10, 50, 100, 500, 1000].freeze
        if avilable_money.include?(money)
          @total += money
        else
          puts "#{money}円は使えません"
        end
    end
  # お金の払い戻し
    def refund
        if @total == 0
          puts "払い戻すお金はありません"
        else
          puts "#{@total}円を払い戻し"
          @total = 0
        end
    end
    def info_money
        puts "ただ今の合計投入金額は、#{@total}円です！"
    end 
end
nodokawaita = VendingMachine.new
nodokawaita.info("水")
nodokawaita.total_money
nodokawaita.insert(100)
nodokawaita.insert(1000)
nodokawaita.refund
nodokawaita.insert(1000)
nodokawaita.info_money





