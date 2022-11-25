class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :comments
  has_one_attached :thumbnail
  has_rich_text :description
  has_one :description, class_name: 'ActionText::RichText', as: :record
  # after_create :search_description
  paginates_per 25

  # scope :latest_for_homepage, -> { self.last(3) }

  def search_description
    ## user object.id cauz it could be deleted or updated between now and job performed
    SearchDescriptionJob.perform_later(id)
  end
end
