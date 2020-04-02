class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], word_id: comment_params[:word_id], user_id: current_user.id)
    respond_to do |format|
      format.html {redirect_to word_path(@comment.word.id)}
      format.json
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private
  def comment_params
    params.permit(:text, :word_id)
  end
end
