class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true

  def self.search(search)
    if search
      Post.where(['description LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end

  belongs_to :user
  has_many :comments
end
