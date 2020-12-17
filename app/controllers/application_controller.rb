class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  @@word_rand = 0

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :user_code])
  end
end
