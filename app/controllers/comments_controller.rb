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

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    if @comment.update(comment_params)
      redirect_to posts_path, success: 'コメントの編集に成功しました'
    else
      redirect_to posts_path, danger: "コメントの編集に失敗しました"
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    if @comment.destroy
      redirect_to posts_path, success: "コメントを削除しました"
    else
      redirect_to posts_path, danger: "コメントの削除に失敗しました"
    end
  end

    private
  def comment_params
    params.require(:comment).permit(:commentcontent)
  end
end
