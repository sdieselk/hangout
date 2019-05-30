class CommentsController < ApplicationController
  def create
    @comment = Comment.new(
      commentcontent: params[:commentcontent],
      post_id: params[:post_id],
      user_id: params[:user_id]
    )
    if  @comment.save
      redirect_to posts_path, success: "コメントに成功しました"
    else
      redirect_to posts_path, danger: "コメントに失敗しました"
    end
  end

    private
  def comment_params
    params.require(:comment).permit(:commentcontent)
  end
end
