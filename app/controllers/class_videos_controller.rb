class ClassVideosController < ApplicationController
  before_action :find_video, only: [:show, :edit, :update, :destroy]

  def index
    @class_videos = ClassVideo.all.order('created_at DESC')
  end

  def new

  end

  def create
    #code
  end

  def show

  end

  def edit
    #code
  end

  def update

  end

  def destroy
    #code
  end

  private
  def find_video
    @class_video = ClassVideo.find(params[:id])
  end
end
