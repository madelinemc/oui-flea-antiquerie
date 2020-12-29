class SessionsController < ApplicationController
    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create
    end

    def destory
    end

    def omniauth_login
    end

    private

end
