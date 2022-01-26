class PostsController < ApplicationController
  before_action :post_find, only: [:destroy, :show]
  
  # 新規投稿
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_path , notice:"NEW！"
  end

  # 一覧表示
  def index
    @posts = Post.all
  end

  # 削除
  def destroy
    @post.destroy
    redirect_to posts_path
  end

  # 詳細
  def show
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def post_find
    @post = Post.find(params[:id])
  end
end
