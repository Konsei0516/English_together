class LikesController < ApplicationController
  before_action :set_word
  
  def create
    @like = Like.create(user_id: current_user.id, word_id: params[:word_id])
    @likes = Like.where(word_id: params[:word_id])
    @words = Word.all
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, word_id: params[:word_id])
    like.destroy
    @likes = Like.where(word_id: params[:word_id])
    @words = Word.all
  end

  private
  def set_word
    @word = Word.find(params[:word_id])
  end
end
