class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.page(params[:page]).per(9).order("created_at ASC").where.not(id: current_user.id)
    @rank_users = User.where(id: Word.group(:user_id).order('count(user_id) desc').limit(3).pluck(:user_id))
  end

  def show
    @user = User.find_by(id: params[:id])
    @words = @user.words.order(created_at: :desc).page(params[:page]).per(6)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings.page(params[:page]).per(6)
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(6)
    render 'show_follower'
  end

  def like
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id).page(params[:page]).per(6)
  end

  def user_search
    @users = User.search(params[:search]).page(params[:page]).per(6)
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile, :image)
  end
end
