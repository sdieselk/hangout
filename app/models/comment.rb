class Comment < ApplicationRecord
  validates :commentcontent, presence: true

  belongs_to :user
  belongs_to :post
end
