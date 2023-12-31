class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  add_flash_types :success, :info, :warning, :danger

  def set_search
    @q = Review.ransack(params[:q])
    @search_reviews = @q.result(distinct: true).page(params[:page]).per(9)
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end