class Comment < ApplicationRecord
  belongs_to :book
  validates :comment, presence: true
  validates :author, presence: true
  validates :author_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: :bad_email }
  validates :book_id, presence: true
end
