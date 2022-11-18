class ApplicationController < ActionController::Base
    protect_from_forgery
    include Pundit
    require 'net/http'
    before_action :loaddata
  
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
    private
  
    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end

    def loaddata
      @q = Book.none.ransack(params[:q])
      @categories = Category.all
      @sitecontent = Sitecontent.first
    end
  end