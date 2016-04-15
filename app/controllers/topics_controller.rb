class TopicsController < ApplicationController
  before_action :find_topic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @topics = Topic.order('created_at DESC').page params[:page]
    # logger.info params
  end

  def show
    @commentable = Topic.find(params[:id])
    @comments = @commentable.comments
  end

  def new
    @topic = current_user.topics.build
  end

  def create
    @topic = current_user.topics.build topic_params
    if @topic.save
      redirect_to @topic, notice: "Successfully create new topics"
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @topic.update topic_params
      redirect_to @topic, notice: "Successfully update topic"
    else
      render 'edit'
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, notice: "Successfully delete the topic"
  end

  private
  def topic_params
    params[:topic].permit(:title, :content)
  end

  def find_topic
    @topic = Topic.find(params[:id])
  end
end
