class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
