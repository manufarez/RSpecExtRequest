class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.fetch(:comment).permit(:content)
  end
end
