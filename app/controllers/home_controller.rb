class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:top,:about]

  def top
    @words = Word.order(created_at: :desc).page(params[:page]).per(6)
  end

  def about
  end
end
