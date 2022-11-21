class ApplicationController < ActionController::Base
    protect_from_forgery
    include Pundit
    require 'net/http'
    before_action :loaddata, :set_locale
  
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

      if params[:q].blank?
        @q = Book.none.ransack(params[:q])
      else
        @q = Book.ransack(params[:q])
        @q.sorts = 'created_at desc' if @q.sorts.empty?
        @books = @q.result.page(params[:page]).per(10)
      end
    end

    def set_locale
      params_locale = params[:locale]

      if params_locale.present?
        I18n.locale = params_locale.to_s.strip.to_sym
      else 
        user_lang_browser = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/)[0].to_s.strip.to_sym
        I18n.locale = I18n.available_locales.include?(user_lang_browser) ? user_lang_browser : I18n.default_locale
      end
    end
  end