class StocksController < ApplicationController
    
    before_action :authenticate_user!, only: :new
    
    def index
        @stocks = Stock.all
    end
    
    def new
        @stock = Stock.new
    end
    
    def create
        @stock = Stock.new(stock_params)
        
        if @stock.save
            redirect_to stocks_path
        else
            render :new
        end
    end
    
    def crawl
        data = CrawlStockDataService.new(['2412', '3662']).fetch_data
        store_to_database(data)
        redirect_to stocks_path
    end
    
    private
    
    def store_to_database(data)
        data.each do |stock_number, stock_price|
            Stock.where(stock_number: stock_number).update_all(current_price: stock_price)
        end
    end
    
    def stock_params
        params.require(:stock).permit(:recommend_date, :stock_number, 
            :stock_name, :enter_date, :enter_price, :target_price, 
            :current_price, :return, :return_ratio, :description)
    end
end
