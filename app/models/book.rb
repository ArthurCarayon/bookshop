class Book < ApplicationRecord
    belongs_to :user

    scope :latest_for_homepage, -> { self.last(3) }
end
