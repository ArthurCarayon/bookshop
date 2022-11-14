class ApplicationController < ActionController::Base
    protect_from_forgery
    include Pundit
    require 'net/http'
  
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


    def verify_recaptcha?(token, recaptcha_action)
      captcha_min_score=0.5
      secret_key = ENV['RECAPTCHA_SECRET_KEY']
  
      uri = URI.parse("https://www.google.com/recaptcha/api/siteverify?secret=#{secret_key}&response=#{token}")
      Net::HTTP.start(uri.host, uri.port, use_ssl: true)
      response = Net::HTTP.get_response(uri)
      json = JSON.parse(response.body)
      json['success'] && json['score'] > captcha_min_score && json['action'] == recaptcha_action
      byebug
    end
  
    private
  
    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
  end