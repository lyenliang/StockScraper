class Stock < ActiveRecord::Base
    def update_current_price!(price)
        self.update_columns(stock_price: price)
    end
end
