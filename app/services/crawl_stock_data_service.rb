class CrawlStockDataService
    
    require 'open-uri'
    # input: the stock numbers to be crawled
    # output: {stock_number => stock_price}
    
    # called when new() is called
    def initialize(target_stocks)
        @target_stocks = target_stocks
    end
    
    def fetch_data
        result = {}
        over_the_counter = fetch_over_the_counter_market
        stock_exchange = fetch_stock_exchange_market
        result.merge!(over_the_counter)
        result.merge!(stock_exchange)
    end
    
    private 
    
    def get_date(line)
        return line[5, 5]
    end
    
    def get_stock_price(line)
        return line.split(",")[8]
    end

    def get_stock_json_data(url)
        doc = Nokogiri::HTML(open(url))
        text = doc.inner_text
        json = JSON.parse(text)
        stock_data = json['aaData']
    end
    
    #上市
    def fetch_stock_exchange_market
        result = {}
        today = Time.now.strftime("%m/%d")
        @target_stocks.each do |stock|
            text = Nokogiri::HTML(open("http://www.twse.com.tw/ch/trading/exchange/STOCK_DAY/STOCK_DAY_print.php?genpage=genpage/Report#{Time.now.strftime("%Y%m")}/201606_F3_1_8_#{stock}.php&type=csv")).inner_text
            if text == ""
                next
            end
            lines = text.split(/\r?\n/)
            lines.each do |line|
                if get_date(line) == today
                    result.merge!(stock => get_stock_price(line))
                end
            end
        end
            
        return result
    end
    
    # 上櫃
    def fetch_over_the_counter_market
        result = {}
        
        stock_data = get_stock_json_data("http://www.tpex.org.tw/web/stock/aftertrading/daily_close_quotes/stk_quote_result.php?l=zh-tw")
        for i in 0..stock_data.size-1
            stock_num = stock_data[i][0]
            stock_price = stock_data[i][2]
        
            if @target_stocks.include?(stock_num)
                puts "stock_num: #{stock_num}"
                puts "stock_price: #{stock_price}"
                result.merge!(stock_num => stock_price)
            end
        end
        return result
    end
end
