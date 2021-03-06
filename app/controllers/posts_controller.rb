class PostsController < ApplicationController
  before_action :post_find, only: [:destroy, :show, :edit, :update]
  
  # 新規投稿
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path , notice:"まーたつぶやいてる"
      else
        render :new
      end
    end
  end

  # 一覧表示
  def index
    @posts = Post.all
  end

  # 削除
  def destroy
    @post.destroy
    redirect_to posts_path , notice:"消すならつぶやくなよ"
  end

  # 詳細
  def show
  end

  # 編集
  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice:"へんしゅうしたよー"
    else
      render :edit
    end
  end

  # 確認
  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def post_find
    @post = Post.find(params[:id])
  end
end
