require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test 'book_creation_whitout_user' do
    book = Book.new
    assert_not book.save
  end
end
