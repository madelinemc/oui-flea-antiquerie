module UsersHelper

    def logged_in_user(user)
        User.find_by_id(session[:user_id]) == user
    end

end
