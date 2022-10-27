class Book < ApplicationRecord
    belongs_to :user
    has_one_attached :thumbnail
    after_create :search_description
    paginates_per 6

    scope :latest_for_homepage, -> { self.last(3) }

    def search_description
        ## user object.id cauz it could be deleted or updated between now and job performed
        SearchDescriptionJob.perform_later(self.id)
    end
end
