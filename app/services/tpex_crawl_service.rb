class TpexCrawlService
    
    require 'open-uri'
    # input: the stock numbers to be crawled
    # output: {stock_number => stock_price}
    
    # called when new() is called
    def initialize(target_stocks)
        @target_stocks = target_stocks
    end
    
    def crawl_tpex
        result = {}
        
        doc = Nokogiri::HTML(open("http://www.tpex.org.tw/web/stock/aftertrading/daily_close_quotes/stk_quote_result.php?l=zh-tw"))
        text = doc.inner_text
        json = JSON.parse(text)
        stock_data = json['aaData']
        for i in 0..stock_data.size-1
            stock_num = stock_data[i][0]
            stock_price = stock_data[i][2]
            # puts stock_num
        
            if @target_stocks.include?(stock_num)
                puts "stock_num: #{stock_num}"
                puts "stock_price: #{stock_price}"
                result.merge!(stock_num => stock_price)
            end
        end
        return result
    end
    
end
