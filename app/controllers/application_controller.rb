class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    keys = [:email, :password, :password_confirmation, :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana,
            :birth_date]
    devise_parameter_sanitizer.permit(:sign_up, keys:)
    devise_parameter_sanitizer.permit(:account_update, keys:)
  end
end
