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

        data = TpexCrawlService.new(['1234', '3662']).crawl_tpex
        
        store_to_database(data)
    end
    
    private
    
    def store_to_database(data)
        
    end
    
    def stock_params
        params.require(:stock).permit(:recommend_date, :stock_number, 
            :stock_name, :enter_date, :enter_price, :target_price, 
            :current_price, :return, :return_ratio, :description)
    end
end
