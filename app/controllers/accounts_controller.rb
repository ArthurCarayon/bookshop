class AccountsController < ApplicationController

    def index
        @user = User.find(current_user.id) 
    end

    def update
        @user = User.find(current_user.id) 
        if @user.update(users_params)
            redirect_to(root_path)
        else
            redirect_to(root_path)
        end
    end

    private

        def users_params
            params.require(:user).permit(:firstname, :lastname, :email)
        end
end