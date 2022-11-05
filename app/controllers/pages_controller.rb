class PagesController < ApplicationController

  def home
    @books = Book.order(created_at: :desc).page(params[:page]).per(10)
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

end
