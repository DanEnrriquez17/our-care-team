class Post < ApplicationRecord
  belongs_to :user
  has_many :post_mentioned_users, dependent: :destroy
  has_many :mentioned_users, through: :post_mentioned_users, source: :user # this is the user's mentioned posts
  has_many_attached :photos
  def owner
    user
  end
end
