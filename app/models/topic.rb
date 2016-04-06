class Topic < ActiveRecord::Base
  has_many :comments, as: :commentable
  belongs_to :user, foreign_key: :user_id

  validates_presence_of :title
  validates_presence_of :content

  # paginates_per 1
end
