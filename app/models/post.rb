class Post < ApplicationRecord
  belongs_to :user
  has_many :post_mentioned_users
  has_many :mentioned_users, through: :post_mentioned_users, source: :user # this is the user's mentioned posts

  def owner
    self.user
  end
end
