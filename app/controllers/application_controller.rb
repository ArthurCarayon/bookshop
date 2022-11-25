class ApplicationController < ActionController::Base
  protect_from_forgery
  include Pundit
  require 'net/http'
  before_action :loaddata, :set_locale

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end

  def loaddata
    @categories = Category.all
    @sitecontent = Sitecontent.first

    if params[:q].blank?
      @q = Book.none.ransack(params[:q]) 
      @booksResult = Book.order(created_at: :desc).page(params[:page]).per(10)
    else
      @q = Book.ransack(params[:q])
      @q.sorts = 'created_at desc' if @q.sorts.empty?
      @booksResult = @q.result.page(params[:page]).per(10)
    end
  end

  def extract_locale
    lang_user = params[:locale] || request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/)[0].to_s.strip.to_sym

    I18n.available_locales.map(&:to_s).include?(lang_user) ? lang_user : nil
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end
end