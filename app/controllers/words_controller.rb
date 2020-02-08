class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def show
  end

  def new
    @word = Word.new(word_params)
    word.save!
    redirect_to words_url
  end

  def edit
  end

  private
  def word_params
    params.require(:word).permit(:name, :description)
  end
end
