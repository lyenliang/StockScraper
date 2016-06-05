class StocksController < ApplicationController
    def index
        @stocks = Stock.all
    end
    
    def new
        @stock = Stock.new
    end
end
