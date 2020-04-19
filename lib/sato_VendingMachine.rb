class VendingMachine
    #ここにドリンク情報をかく
    def stock_price                                       
        @cola = [120,5]
        @redbull = [200,5]
        @water = [100,5]
    end
    #ここはinfoをよぶと商品情報が出力される
    def info(drink_name)
        stock_price
        stocks_down(drink_name)
        if drink_name == "コーラ"
            puts "コーラは#{@cola[0]}円で在庫本数は#{@cola[1]}本です！"
        elsif drink_name == "レッドブル"
            puts "レッドブルは#{@redbull[0]}円で在庫本数は#{@redbull[1]}本です！"
        elsif drink_name == "水"
            puts "水は#{@water[0]}円で在庫本数は#{@water[1]}本です！"
        else
            puts "そんな飲み物はありません"
        end
    end
    #totalの初期値
    def total_money
        @total = 0
    end
      # お金の投入と選別
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
          puts "購入できません"
        else
          puts "#{@total}円を払い戻し"
          @total = 0
        end
    end
    #商品の選択
    # def select_drink(drink_name)
    #     avilable_drink = ["コーラ", "レッドブル", "水"]
    #     if avilable_drink.include?(drink_name)
    #         @select = 0
    #     else
    #         puts "そんな名前の飲み物知らない。"
    #     end
    # end
    #在庫はあるか？
    def stock_ok?(drink_name)
        if drink_name == "コーラ"
            if (@cola[1] - 1) >= 0
                @stocks = 0
            else
                puts "在庫がありません売り切れです！"
                @stocks = 1
            end
        elsif drink_name == "レッドブル"
            if (@redbull[1] - 1) >= 0
                @stocks = 0
            else
                puts "在庫がありません売り切れです！"
                @stocks = 1
            end
        elsif drink_name == "レッドブル"
            if (@redbull[1] - 1) >= 0
                @stocks = 0
            else
                puts "在庫がありません売り切れです！"
                @stocks = 1
            end
        else
            puts "そんな名前の飲み物は販売していません。"
        end
    end
    #お金が足りるか確認
    def moneyok?(drink_name)
        if drink_name == "コーラ"
            if (@total - 120) >= 0
                @okmaney = 0
            else
                puts "投入金額が足りません"
                @okmaney = 1
            end
        elsif drink_name == "レッドブル"
            if (@total - 200) >= 0
                @okmaney = 0
            else
                puts "投入金額が足りません"
                @okmaney = 1
            end
        elsif drink_name == "レッドブル"
            if (@total - 200) >= 0
                @okmaney = 0
            else
                puts "投入金額が足りません"
                @okmaney = 1
            end
        end
    end
    
    #これ動いてない
    # def money_sum(drink_name)
    #     stock_price
    #     if @okmaney == 0 and @stocks == 0
    #         if drink_name == "cola"
    #             @total = @total + @cola[0]
    #         elsif drink_name == "水"
    #             @total = @total + @water[0]
    #         else
    #             @total = @total + @redbull[0]
    #         end
    #     else
    #         refund
    #     end
    # end
    
    #投入金額と在庫があれば処理が行われる
    def purchase(drink_name)
        if @okmaney == 0 and @stocks == 0
            puts "#{drink_name}を取り出し口からお取りください"
        else
            refund
        end
    end
    
    #ここでいくつかの処理を同時に行うことができる
    def buy(drink_name)
        avilable_drink = ["コーラ", "レッドブル", "水"]
        if avilable_drink.include?(drink_name)
            stock_ok?(drink_name)
            moneyok?(drink_name)
            purchase(drink_name)
            price(drink_name)
            refund
            stocks_down(drink_name)
        else
            puts "そんな名前の飲み物知らない。"
            refund
        end
    end
    
    
    #ここでは自販機内部のお金のデータを保持します
    def bank
        @havemoney = 10000
    end
    
    #購入可能の時に内部に売上金を加算
    def price(drink_name)
        bank
        if @okmaney == 0 and @stocks == 0
            if drink_name == "コーラ"
                @havemoney = @havemoney + 120
                @total = @total - 120
            elsif drink_name == "レッドブル"
                @havemoney = @havemoney + 200
                @total = @total - 200
            elsif drink_name == "水"
                @havemoney = @havemoney + 100
                @total = @total - 100
            end
        end
    end
    
    #お金がどのくらいあるかわかる
    def bank_info
        puts "内部金庫には#{@havemoney}円あります。"
    end
    
    #ここで商品の減算数
    def stocks_down(drink_name)
        stock_price
        
         if @okmaney == 0 and @stocks == 0
            if drink_name == "コーラ"
                @cola[1] = @cola[1] - 1
            elsif drink_name == "レッドブル"
                @redbull[1] = @redbull[1] - 1
            elsif drink_name == "水"
                @water = @water[1] - 1
            end
        end
        
        
    end
    
    
end
nodokawaita = VendingMachine.new
nodokawaita.info("コーラ")
nodokawaita.total_money
nodokawaita.insert(100)
nodokawaita.insert(50)
nodokawaita.buy("コーラ")
nodokawaita.bank_info
nodokawaita.info("コーラ")



