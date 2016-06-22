module StocksHelper
    def render_return_ratio(current_price, enter_price)
        value = ((current_price - enter_price) * 100 / enter_price).round(2)
        
        return render_color_text(value, '%')
    end
    
    def render_return_diff(current_price, enter_price)
        value = (current_price - enter_price).round(2)
        
        return render_color_text(value)
    end 
    
    private 
    
    def render_color_text(value, suffix='')
        if value > 0
            return content_tag(:span, value.to_s + suffix, :class => :red_text)
        elsif value < 0
            return content_tag(:span, value.to_s + suffix, :class => :green_text)
        else 
            return content_tag(:span, value.to_s + suffix)
        end
    end
end
