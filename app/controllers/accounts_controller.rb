class AccountsController < ApplicationController

    def index
        @user = current_user
        @books = Book.where(:user_id => @user.id)
    end

    def show
        @user = current_user
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
            params.require(:user).permit(:firstname, :lastname, :email, :avatar)
        end
end