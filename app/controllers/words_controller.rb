class WordsController < ApplicationController
  before_action :set_word, only: [:edit,:update,:destroy]
  before_action :set_category,only: [:index,:new,:edit,:update,:create,:search]

  def index
    @words = Word.order(created_at: :desc).page(params[:page]).per(9)
    @word_ranks = Word.find(Like.group(:word_id).order('count(word_id) desc').limit(3).pluck(:word_id))
  end

  def show
    @word = Word.find(params[:id])
    @user = User.find(@word.user_id)
    @comment = Comment.new
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
      redirect_to words_path, notice:"投稿しました"
    else
      render :new
    end
  end

  def destroy
    @word.destroy
    redirect_to words_url,notice:"削除しました"
  end

  def search
    @words = Word.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def word_params
    params.require(:word).permit(:name,:description,:category)
  end

  def set_word
    @word = current_user.words.find(params[:id])
  end

  def set_category
    @categories = ['単語','熟語','長文','その他']
  end
end
