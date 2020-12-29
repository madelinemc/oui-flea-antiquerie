class AntiquesController < ApplicationController
    before_action :set_antique, only: [:show, :edit, :update, :destory]

    def index
        @antiques = Antique.all
    end

    def new
        @antique = Antique.new
    end

    def create
        antique = Antique.create(antique_params)
        redirect_to antique_path(antique)
    end

    def show
        @user = User.find_by_id(@antique.user_id)
        @category = Category.find_by_id(@antique.category_id)
        @market = Market.find_by_id(@antique.market_id)
    end

    def edit
    end
    
    def update
        antique = Antique.find_by(id: params[:id])
        antique.update(antique_params)
        redirect_to antique_path(antique)
    end

    def destroy
        antique = Antique.find_by(id: params[:id])
        antique.destory
        redirect_to antiques_path
    end

    private

    def set_antique
        @antique = Antique.find_by(id: params[:id])
    end

    def antique_params
        params.require(:antique).permit(:description, :photo, :period, :provenance)
    end

end