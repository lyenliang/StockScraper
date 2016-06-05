require 'open-uri'
require 'nokogiri'
require 'byebug'
require 'json'


#doc = Nokogiri::HTML(open("http://www.tdcc.com.tw/smWeb/QryStock.jsp?SCA_DATE=20160527&SqlMethod=StockNo&StockNo=3662&StockName=&sub=%ACd%B8%DF"))
#size = doc.css("table")[3].css("tr").css("td").css("select").css("option").size
#puts doc.css("table")[3].css("tr").css("td").css("select").css("option")[0].inner_text
doc = Nokogiri::HTML(open("http://www.tpex.org.tw/web/stock/aftertrading/daily_close_quotes/stk_quote_result.php?l=zh-tw"))
text = doc.inner_text
json = JSON.parse(text)
stock_data = json['aaData']
puts stock_data
for i in 0..stock_data.size-1
    stock_num = stock_data[i][0]
    puts stock_num
end


