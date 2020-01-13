class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @user = User.find(params[:id])
  end
end
