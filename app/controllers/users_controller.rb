class UsersController < ApplicationController
  before_action :find_user, only: [:comments, :topics]
  before_action :authenticate_user!, except: [:comments, :topics]

  def topics
    @content = @user.topics
  end

  def comments
    @content = @user.comments
  end

  def account
    @user = current_user
    #code
  end

  def password
    @user = current_user
    #code
  end

  def profile
    #code
  end

  def notifications
    #code
  end

  def update_user
    @user = current_user
    pp user_params
    @user.update user_params
    # sign_in @user, :bypass => true
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def find_user
    @user = User.find_by_nickname(params[:nickname])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :avartar, :current_password, :password, :password_confirmation)
  end
end
