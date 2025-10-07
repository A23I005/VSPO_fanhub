class Post < ApplicationRecord
  belongs_to :user
  validates :title, :body, presence: true

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
end
