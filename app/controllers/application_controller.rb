# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name date_of_birth telephone username])
  end

  private

  def set_user
    @user = User.find_by(id: current_user.id)
  end
end
