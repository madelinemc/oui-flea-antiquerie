class MarketsController < ApplicationController
    before_action :set_market, only: [:show, :edit, :update]
      
    def index
        @markets = Market.all
    end

    def new
        @market = Market.new
    end

    def create
        market = Market.create(market_params)
        redirect_to market_path(market)
    end

    def show
    end

    def edit
    end
    
    def update
        market = Market.find_by(id: params[:id])
        market.update(market_params)
        redirect_to market_path(market)
    end

    private

    def set_market
        @market = Market.find_by(id: params[:id])
    end

    def market_params
        params.require(:market).permit(:name, :location, :type, :season, :number_of_vendors)
    end

end