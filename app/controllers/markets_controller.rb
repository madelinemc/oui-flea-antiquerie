class MarketsController < ApplicationController
    before_action :set_market, only: [:show, :edit, :update, :delete]
    before_action :require_login, only: [:new, :create, :edit, :update, :delete]
      
    def index
        @markets = Market.all
    end

    def new
        @market = Market.new
    end

    def create
        @market = Market.create(market_params)
        if @market.valid?
            @market.save
            redirect_to market_path(@market)
        else
            render :new
        end
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

    def delete
        @market.destroy
        redirect_to markets_path
    end

    private

    def set_market
        @market = Market.find_by(id: params[:id])
    end

    def market_params
        params.require(:market).permit(:name, :location, :market_type, :season, :number_of_vendors, :market_photo)
    end

end