class CommentsController < ApplicationController
   before_action :find_commentable

   def create
     @comment = @commentable.comments.build(comment_params.merge(user: current_user))
     @comment.save
     @comments = @commentable.comments
     respond_to do |format|
       format.html {redirect_to @commentable}
       format.js
     end
   end

   private

   def find_commentable
     @commentable = ClassVideo.find(params[:class_video_id]) || Topic.find(params[:topic_id])
   end

   def comment_params
     params[:comment].permit(:content)
   end
end
