class StocksController < ApplicationController
    
    before_action :authenticate_user!, only: [:new, :index]
    
    def index
        @stocks = Stock.all
        @return_diff = 0
    end
    
    def edit
        @stock = Stock.find(params[:id])
    end
    
    def update
        @stock = Stock.find(params[:id])
        
        if @stock.update(stock_params)
            redirect_to stocks_path
        else
            render :edit
        end
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
    
    def destroy
        @stock = Stock.find(params[:id])
        
        @stock.destroy
        
        redirect_to stocks_path
    end
    
    def crawl
        CrawlStockDataService.new.start_carwling
        redirect_to stocks_path
    end
    
    private
    
    def stock_params
        params.require(:stock).permit(:recommend_date, :stock_number, 
            :stock_name, :enter_price, :target_price, 
            :current_price, :description)
    end
end
