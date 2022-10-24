class AccountsController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id]) 
    end

    def edit
        @user = current_user
    end

    def update
        if current_user.update(users_params)
            flash.notice = "User updated successfuly!"
        else
            flash.alert = "Error : user not saved!"
        end
        redirect_to :account
    end

    def destroy
        current_user.destroy
        redirect_to :root, notice: 'Your account has been destroyed'
    end

    private
        def users_params
            params.require(:user).permit(:firstname, :lastname, :email)
        end
end