class UsersController < ApplicationController
  def index
    @users = User.new.all.order(created_at: :desc)
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    @user.admin = current_user
    @user.save!
    redirect_to users_path
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
    if @user.update(params_user)
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user), status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def params_user
    params.require(:user).permit(:email, :role, :first_name, :last_name, :phone_number, photos:[])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
