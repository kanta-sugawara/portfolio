class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.find(params[:review_id])
    if current_user != @review.user
      @comment = @review.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        flash[:notice] = "コメントを投稿しました。"
        redirect_to @review
      else
        render 'reviews/show'
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました。"
    redirect_to @comment.review
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end