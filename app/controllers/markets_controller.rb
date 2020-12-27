class MarketsController < ApplicationController
    before_action :set_market, only: [:show, :edit, :update, :destory]
      
    def index
    end

    def new
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

end
