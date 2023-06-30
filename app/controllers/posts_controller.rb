class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
    @users = User.all
  end

  # def new
  #   @post = Post.new
  # end

  def create
    @post = Post.new(params_post)
    @post.user = current_user
    create_post_mentioned_users(@post)
    @post.save!
    redirect_to posts_path
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
    params.require(:post).permit(:title, :content, photos: [])
  end

  def create_post_mentioned_users(post)
    post.content.scan(/#\w+/).each do |mentioned_user|
      user = User.find_by(first_name: mentioned_user[1..-1])
      PostMentionedUser.create!(user: user, post: post)
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
