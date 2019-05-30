class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true


  belongs_to :user
  has_many :comments
end
