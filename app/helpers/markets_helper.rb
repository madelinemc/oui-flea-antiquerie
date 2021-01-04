module MarketsHelper

    def select_market_image(market, is_instance_variable)
        if market.market_photo.attachment
            is_instance_variable ? "<img> #{image_tag @market.market_photo} </img>".html_safe : "<img> #{image_tag market.market_photo} </img>".html_safe
        else
            "<img> #{image_tag("market-placeholder-image")} </img>".html_safe
        end
    end
end
