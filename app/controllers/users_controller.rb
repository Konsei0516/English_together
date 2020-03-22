class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @word = @user.words.order(created_at: :desc)
    @words = Word.order(created_at: :desc).page(params[:page]).per(6)
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

  def like
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end
end
