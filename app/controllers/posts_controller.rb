class PostsController < ApplicationController
  before_action :post_find, only: [:destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to new_post_path
  end

  def index
    @posts = Post.all
  end


  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def post_find
    @post = Post.find(params[:id])
  end
end
