class AntiquesController < ApplicationController
    before_action :set_antique, only: [:show, :edit, :update, :destroy]
    before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

    def index
        if params[:market_id]
            @market = Market.find_by(id: params[:market_id])
            if @market
                @antiques = @market.antiques
            end
        elsif params[:category_id]
            @category = Category.find_by_id(params[:category_id]) 
            @antiques = @category.antiques
        else
            @antiques = Antique.latest_antiques(18)
        end
    end



    def new
        @antique = Antique.new
        if params[:market_id]
            market = Market.find_by(id: params[:market_id])
            if market
                @antique.market = market
            end
        else
            @markets = Market.all
            @antique.build_market
        end
    end

    def create
        @antique = Antique.new(antique_params)
        @antique.user_id = session[:user_id]
        if @antique.valid? 
            @antique.save
            if params[:market_id]
                redirect_to market_antique_path(params[:market_id])
            else
                redirect_to antique_path(@antique)
            end
        else
            if params[:market_id]
                market = Market.find_by(id: params[:market_id])
                if market
                    @antique.market = market
                end
            else
                @markets = Market.all
                @antique.build_market
            end
            render :new
        end
    end

    def show
        @user = @antique.user
        @category = @antique.category
        @market = @antique.market
    end

    def edit
    end
    
    def update
        #antique = Antique.find_by(id: params[:id])
        @antique.update(antique_params)
        redirect_to antique_path(@antique)
    end

    def destroy
        #antique = Antique.find_by(id: params[:id])
        @antique.destroy
        redirect_to antiques_path
    end

    private

    def set_antique
        @antique = Antique.find_by(id: params[:id])
    end

    def antique_params
        params.require(:antique).permit(:description, :antique_photo, :period, :provenance, :category_id, :market_id, market_attributes: [:name])
    end

end