class AntiquesController < ApplicationController
    before_action :set_antique, only: [:show, :edit, :update, :destory]

    def index
        @antiques = Antique.all
    end

    def new
        @antique = Antique.new
    end

    def create
        @antique = Antique.new(antique_params)
        @antique.user_id = session[:user_id]
        if @antique.valid? 
            @antique.save
            redirect_to antique_path(@antique)
        else
            render :new
        end
    end

    def show
        @user = User.find_by_id(@antique.user_id) #or = @antique.user
        @category = Category.find_by_id(@antique.category_id) #or = @antique.category
        @market = Market.find_by_id(@antique.market_id) #or = @antique.market
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
        params.require(:antique).permit(:description, :antique_photo, :period, :provenance, :category_id, :market_id)
    end

end