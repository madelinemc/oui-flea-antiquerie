module MarketsHelper

    def select_market_image(market)
        if market.market_photo.attachment
            "<img> #{image_tag @market.market_photo} </img>".html_safe
        else
            "<img> #{image_tag("market-placeholder-image")} </img>".html_safe
        end
    end
end
