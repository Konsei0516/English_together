class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @words = current_user.words.order(created_at: :desc)
  end

  def edit
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
end
