class PagesController < ApplicationController

  def home 
    if params[:q] && params[:q][:category_id_eq]
      @searchedCateg = Category.find(params[:q][:category_id_eq])
    end
  end

end
