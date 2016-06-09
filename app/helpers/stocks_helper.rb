module StocksHelper
    def render_return_ratio(current_price, enter_price)
        return ((current_price - enter_price) * 100 / enter_price).round(2)
    end
    
    def render_return_diff(current_price, enter_price)
        return (current_price - enter_price)
    end
end
