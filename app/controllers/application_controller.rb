class ApplicationController < ActionController::Base
    helper_method :current_user, :is_logged_in?, :require_login

    def is_logged_in?
        !!session[:user_id]
    end

    def current_user
        @user ||= User.find_by_id(session[:user_id])
    end

    def require_login
        unless is_logged_in?
            redirect_to home_path
        end
    end


end
