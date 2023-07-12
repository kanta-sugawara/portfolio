class HomesController < ApplicationController
  def top
    @user = current_user
    @reviews = Review.page(params[:page]).reverse_order
  end
end
