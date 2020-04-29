class WordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_word, only: [:edit,:update,:destroy]
  before_action :set_category,only: [:index,:new,:edit,:update,:create,:search]
  before_action :set_available_tags_to_gon, only: [:new, :edit]
  before_action :set_word_tags_to_gon,only: [:edit]

  def index
    @words = Word.order(created_at: :desc).page(params[:page]).per(9).includes(:tags)
    @word_ranks = Word.find(Like.group(:word_id).order('count(word_id) desc').limit(3).pluck(:word_id))
    @tags = ActsAsTaggableOn::Tag.most_used
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
      render :new, alert:"投稿に失敗しました"
    end
  end

  def destroy
    if @word.destroy
      redirect_to words_url,notice:"削除しました"
    else
      redirect_to words_url,alert:"削除に失敗しました"
    end
  end

  def tag_index
    @words = Word.tagged_with(params[:tag_name]).page(params[:page]).per(9)
    @tag_name = params[:tag_name]
  end

  def search
    @words = Word.search(params[:keyword]).page(params[:page]).per(9)
    if params[:category].present?
      @words = @words.get_by_category params[:category]
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def word_params
    params.require(:word).permit(:name,:description,:category,:tag_list)
  end

  def set_word
    @word = current_user.words.find(params[:id])
  end

  def set_category
    @categories = ['単語','熟語','長文','その他']
  end

  def set_available_tags_to_gon
    gon.available_tags = Word.tags_on(:tags).pluck(:name)
  end

  def set_word_tags_to_gon
    gon.word_tags = @word.tag_list
  end
end
