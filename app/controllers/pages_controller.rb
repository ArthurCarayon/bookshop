class PagesController < ApplicationController

  def home
    @books = Book.latest_for_homepage
  end

end
