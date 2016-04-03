class ClassVideosController < ApplicationController
  before_action :find_video, only: [:show, :edit, :update, :destroy]

  def index
    @class_videos = ClassVideo.all.order('created_at ASC')
  end

  def show

  end

  def new
    @class_video = ClassVideo.new
  end

  def create
    @class_video = ClassVideo.new video_params

    if @class_video.save!
      redirect_to @class_video, notice: "Successfully create new class_videos"
    else
      render 'new'
    end
  end

  def edit
    #code
  end

  def update
    if @class_video.update(video_params)
      redirect_to @class_video
    else
      render 'edit' # render 带参数，所以回来的时候，之前填写的数据不会丢失
    end
  end

  def destroy
    @class_video.destroy
    redirect_to root_path, notice: "Successfully delete the class video"
  end

  private

  def video_params
    params[class_video].permit(:title, :speakers, :cover_image, :play_count, :video, :description)
  end

  def find_video
    @class_video = ClassVideo.find(params[:id])
  end
end
