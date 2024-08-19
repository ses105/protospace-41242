class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @prototype = @comment.prototype
    if @comment.save
      redirect_to prototype_path(@prototype)
    else
      @comments = Comment.includes(:user)
      render "prototypes/show", status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id], user_id: current_user.id)
  end
end
