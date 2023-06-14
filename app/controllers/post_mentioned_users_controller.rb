class PostMentionedUsersController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @post_mentioned_user = PostMentionedUser.new(params_mentioned_users)
    @post_mentioned_user.post = post
    if @post_mentioned_user.save
      redirect_to post_path(post), alert: " you tagged #{@post_mentioned_user.user.first_name} in a comment"
    else
      redirect_to post_path(post), status: :unprocessable_entity
    end
  end

  private
  def params_mentioned_users
    params.require(:post_mentioned_user).permit(:user_id)
  end
end
