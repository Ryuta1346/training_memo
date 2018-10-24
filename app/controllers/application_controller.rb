class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:started_at])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:started_at])
    devise_parameter_sanitizer.permit(:account_update, keys: [:started_at])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:finished_at])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:finished_at])
    devise_parameter_sanitizer.permit(:account_update, keys: [:finished_at])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:aim])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:aim])
    devise_parameter_sanitizer.permit(:account_update, keys: [:aim])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:weight])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:weight])
    devise_parameter_sanitizer.permit(:account_update, keys: [:weight])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:body_fat_percentage])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:body_fat_percentage])
    devise_parameter_sanitizer.permit(:account_update, keys: [:body_fat_percentage])
  end
end
