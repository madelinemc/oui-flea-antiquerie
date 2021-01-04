class UsersController < ApplicationController
    before_action :require_login, only: [:edit]

    def show #users "profile" page
        @user = User.find_by(id: params[:id])
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

    def destroy
        current_user.destroy
        redirect_to home_path
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :password, :about, :profile_picture, :username, :email)
    end

end
