class Topic < ActiveRecord::Base
  has_many :comments, as: :commentable
  belongs_to :user, foreign_key: :user_id
end
