class PostsController < ApplicationController
  before_action :post_find, only: [:destroy, :show, :edit, :update]
  
  # 新規投稿
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path , notice:"NEW！"
    else
      render :new
    end
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

  # 編集
  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice:"UPDATE！"
    else
      render :new
    end
  end

  # 確認
  def confirm
    
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def post_find
    @post = Post.find(params[:id])
  end
end
