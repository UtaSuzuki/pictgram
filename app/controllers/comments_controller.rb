class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = current_user.comments.new(comment_params)
    @comment.topic_id = @topic.id
    if @comment.save
      redirect_to topics_path, success: 'コメントしました'
    else
      redirect_to topics_path, danger: 'コメントできませんでした'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
