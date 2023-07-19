class UsersController < ApplicationController
  before_action :set_user, only: [:favorites]

  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @following_users = @user.following_users
    @follower_users = @user.follower_users
    @reviews = @user.reviews.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
    if current_user !=  @user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.following_users
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.follower_users
  end

  def favorites
    favorites = Favorite.where(user_id: @user.id).pluck(:review_id)
    @favorite_reviews = Review.find(favorites)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
