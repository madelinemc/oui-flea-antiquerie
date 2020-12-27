class AntiquesController < ApplicationController
    before_action :set_antique, only: [:show, :edit, :update, :destory]

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

    def set_antique
        @antique = Antique.find(params[:id])
    end

end
