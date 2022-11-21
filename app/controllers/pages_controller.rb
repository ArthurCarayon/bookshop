class PagesController < ApplicationController
  def home
    @books = Book.order(created_at: :desc).page(params[:page]).per(10)
  end
end
