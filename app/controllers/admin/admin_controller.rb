class Admin::AdminController < ApplicationController
  layout "application"
  include Pundit

  def index
    @users = User.order(:created_at).page params[:page]
    @books = Book.order(:created_at).page params[:page]

    authorize @users
  end

  def signasuser
    if current_user.admin?
      @user = User.find(params.require(:id))
      sign_in(:user, @user)
      redirect_to account_path
    end
  end

  ## needhelp creer un bouton de sign back as admin
  def signback
    @user = User.find(backuserid)
    sign_in(:user, @user)
    redirect_to admin_path
  end

end