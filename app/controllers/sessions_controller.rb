class SessionsController < ApplicationController
    before_action :already_logged_in?, only: [:home, :new]

    def home #main page of application
    end

    def about
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

    def destroy
        session[:user_id] = nil
        redirect_to home_path
    end

    def omniauth
        @user = User.create_from_omniauth(auth)
        if @user.valid?
            session[:user_id] = @user.id
            @user.save
            redirect_to user_path(@user)
        else
            #flash[:message] = user.errors.full_messages.join(", ")
            redirect_to home_path
        end
    end

    private

    def already_logged_in?
        if is_logged_in?
            redirect_to user_path(User.find_by_id(session[:user_id]))
        end
    end

    def auth
        request.env['omniauth.auth']
    end

end
