class Topic < ActiveRecord::Base
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user, foreign_key: :user_id

  validates_presence_of :title, message: '标题不能为空'
  validates_presence_of :content, message: '话题内容不能为空'

  # paginates_per 1
end
