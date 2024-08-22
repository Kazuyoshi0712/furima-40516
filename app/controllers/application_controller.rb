class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :nickname, :first_name, :last_name, :first_name_kana,
                         :last_name_kana, :birth_date)
    end

    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :nickname, :first_name, :last_name, :first_name_kana,
                         :last_name_kana, :birth_date)
    end
  end
end
