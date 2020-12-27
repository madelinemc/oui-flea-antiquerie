class MarketsController < ApplicationController
    before_action :set_market, only: [:show, :edit, :update, :destory]
      
    def index
        @markets = Market.all
    end

    def new
        @market = Market.new
    end

    def create
    end

    def show
    end

    def edit
    end
    
    def update
    end

    def destroy
    end

    private

    def set_market
        @market = Market.find(params[:id])
    end

    def market_params
        params.require(:market).permit(:name, :location, :type, :season, :number_of_vendors)
    end

end