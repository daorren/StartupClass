class TopicsController < ApplicationController
  before_action :find_topic, only: [:show, :edit, :update, :destroy]

  def index
    #code
  end

  def show
    #code
  end

  def new
    #code
  end

  def create
    #code
  end

  def edit
    #code
  end

  def update
    #code
  end

  def destroy
    #code
  end

  private
  def topic_params
    params[:topic].permit[:content]
  end

  def find_topic
    @topic = Topic.find(params[:id])
  end
end
