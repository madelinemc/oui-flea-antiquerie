class UsersController < ApplicationController
    before_action :require_login, only: [:index, :show, :edit]

    def index #users "home" page
        current_user
        @antiques = Antique.all
    end

    def show #users "profile" page
        current_user
        @owned_antiques = @user.owned_antiques
    end
    
    def new #sign up - render user signup form 
        @user = User.new
    end

    def create #commit new user to db
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render new_user_path
        end
    end

    def edit #render form to edit user info
        if current_user.id != params[:id].to_i
            redirect_to edit_user_path(@user)
        end
    end

    def update #commit updates to user info to db
        if current_user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :password, :about, :profile_photo, :username, :email)
    end

end
