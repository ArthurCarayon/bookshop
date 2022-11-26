class Comment < ApplicationRecord
  belongs_to :book
  validates :comment, presence: true
  validates :author, presence: true
  validates :author_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: :bad_email }
  validates :book_id, presence: true
  before_save :sanitize_content

  def sanitize_content
    self.comment = ActionView::Base.full_sanitizer.sanitize(self.comment)
    self.author = ActionView::Base.full_sanitizer.sanitize(self.author)
    self.author_email = ActionView::Base.full_sanitizer.sanitize(self.author_email)
  end
end
