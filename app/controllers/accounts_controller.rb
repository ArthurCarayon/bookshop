class AccountsController < ApplicationController

    def index
      @user = current_user 
      @sitecontent = Sitecontent.first
      if params[:q].blank?
        @q = Book.none.ransack(params[:q])
      else
        @q = Book.ransack(params[:q])
        @q.sorts = 'created_at desc' if @q.sorts.empty?
      end
    end

    def show
      @category = Category.new
      @categories = Category.all
      @q = Book.none.ransack(params[:q])

      if(params[:id])
        @user = User.find(params[:id])
      else
        @user = current_user
      end
      @books = Book.where(:user_id => @user.id).order(:title).page params[:page]

      if Sitecontent.first.present?
        @sitecontent = Sitecontent.first
      else
        @sitecontent = Sitecontent.new
      end
    end

    def edit
      @user = current_user
      authorize @user
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
      if(params[:id])
        @user = User.find(params[:id])
        @notice = "Account has been deleted"
        @redirect = :admin
      else
        @user = current_user
        @notice = "Your account has been deleted"
        @redirect = :root
      end
      @user.destroy
      redirect_to @redirect, notice: @notice
    end

    private
        def users_params
            params.require(:user).permit(:firstname, :lastname, :email, :avatar)
        end
end