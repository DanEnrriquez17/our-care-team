class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :post_mentioned_users
  has_many :mentioned_users, through: :post_mentioned_users, source: :user # this is the user's mentioned posts
end
