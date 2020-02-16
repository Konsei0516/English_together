class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def show
    @word = Word.find(params[:id])
  end

  def new
    @word = Word.new
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    word = Word.find(params[:id])
    word.update!(word_params)
    redirect_to word_url
  end

  def create
    word = Word.new(word_params)
    word.save!
    redirect_to words_url
  end

  private
  def word_params
    params.require(:word).permit(:name, :description)
  end
end
