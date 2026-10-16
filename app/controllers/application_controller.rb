class ApplicationController < ActionController::Base
  before_action :configure_params, if: :devise_controller?

  protected

  def configure_params
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:name, :phone_number, :age, :role]
    )
  end
end