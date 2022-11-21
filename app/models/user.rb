class User < ApplicationRecord
  ## dependent destroy books when user is destroyed - link
  has_many :books, dependent: :destroy
  has_one_attached :avatar
  paginates_per 25

  enum role: {
    basic: 0,
    editor: 1,
    admin: 2
  }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
