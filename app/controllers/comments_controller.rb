class CommentsController < ApplicationController

  def create
    @comment = Comment.create(params.require(:comment).permit(:comment).merge(user: current_user, post_id: params[:post_id]))
    redirect_to @comment.post
  end

end
