class CommentsController < ApplicationController
  before_action :find_commentable
  before_action :authenticate_user!

  def create
   @comment = @commentable.comments.build(comment_params.merge(user: current_user))
   @comment.save!
   @comments = @commentable.comments
   respond_to do |format|
     format.html {redirect_to @commentable}
     format.js
   end
  end

  private

  def find_commentable
   c_id = params[:class_video_id]
   t_id = params[:topic_id]
   @commentable = if c_id.present?
                    ClassVideo.find(c_id)
                  else t_id.present?
                    Topic.find(t_id)
                  end
  end

  def comment_params
   params[:comment].permit(:content)
  end
end
