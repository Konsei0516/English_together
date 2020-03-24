class WordsController < ApplicationController
  before_action :set_word, only: [:edit,:update,:destroy]

  def index
    @words = Word.order(created_at: :desc).page(params[:page]).per(6)
  end

  def show
    @word = Word.find(params[:id])
    @user = User.find(@word.user_id)
    @comments = @word.comments.includes(:user)
  end

  def new
    @word = Word.new
  end

  def edit
  end

  def update
    @word.update!(word_params)
    redirect_to word_url
  end

  def create
    @word = Word.new(word_params.merge(user_id: current_user.id))
    
    if @word.save
      redirect_to @word
    else
      render :new
    end
  end

  def destroy
    @word.destroy
    redirect_to words_url
  end

  private
  def word_params
    params.require(:word).permit(:name,:description)
  end

  def set_word
    @word = current_user.words.find(params[:id])
  end
end
