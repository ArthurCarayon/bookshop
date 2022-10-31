class Admin::AdminController < ApplicationController
  layout "application"
  include Pundit

  def index
    @users = User.order(:created_at).page params[:page]
    @books = Book.order(:created_at).page params[:page]

    authorize @users
  end
end