class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.user = current_user
    @post.save!
    redirect_to @post
  end

  def edit
  end

  def show
  end

  def update
    if @post.update(params_post)
      redirect_to post_path(@post)
    else
      redirect_to edit_post_path(@post), status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, status: :see_other
  end

  private

  def params_post
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
