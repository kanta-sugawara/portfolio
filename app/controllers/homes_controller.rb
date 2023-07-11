class HomesController < ApplicationController
  def top
    @user = current_user
    @reviews = Review.all
  end
end
