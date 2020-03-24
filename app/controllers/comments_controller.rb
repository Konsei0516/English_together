class CommentsController < ApplicationController
  def create
    comment = Comment.create(text: comment_params[:text], word_id: comment_params[:word_id], user_id: current_user.id)
    redirect_to word_path(comment.word.id)
  end

  def destroy
  end

  private
  def comment_params
    params.permit(:text, :word_id)
  end
end
