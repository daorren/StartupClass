class UsersController < ApplicationController
  before_action :find_user, only: [:show, :comments, :topics]
  def topics
    @content = @user.topics
  end

  def comments
    @content = @user.comments
  end

  private

  def find_user
    @user = User.find_by_nickname(params[:nickname])
  end
end
