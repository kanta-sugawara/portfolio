class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    @user = current_user
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:notice] = "投稿に成功しました"
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    if current_user != @review.user
      redirect_to reviews_path
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "編集に成功しました"
      redirect_to review_path(@review)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    permitted_params.tap do |p|
      p[:user_id] = current_user.id
    end
  end

  def permitted_params
    params.require(:review).permit(:title, :body, :rate, :total_time, :total_charge, :review_image)
  end
end
