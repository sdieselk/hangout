class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to posts_path, success: '投稿の編集に成功しました'
    else
      flash.now[:danger] = "投稿の編集に失敗しました"
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:description)
  end
end
