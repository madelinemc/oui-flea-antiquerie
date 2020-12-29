class SessionsController < ApplicationController
    #before_action :already_logged_in?, only: [:home, :new]

    def home #main page of application
    end

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render new_session_path
        end
    end

    def destory
        session.clear
        redirect_to home_path
    end

    def omniauth_login
    end

    private

    def already_logged_in?
        if is_logged_in?
            redirect_to user_path(User.find_by_id(session[:user_id]))
        end
    end

end
