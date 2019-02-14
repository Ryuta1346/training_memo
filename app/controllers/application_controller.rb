class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  if Rails.env.production? || ENV["RESCUE_EXCEPTIONS"]
    rescue_from StandardError, with: :rescue_internal_server_error
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found
    rescue_from ActionController::ParameterMissing, with: :rescue_bad_request
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :started_at, :finished_at, :aim, :weight, :bmi, :height])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :started_at, :finished_at, :aim, :weight, :bmi, :height])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :started_at, :finished_at, :aim, :weight, :bmi, :height])
    end

  private

    def rescue_internal_server_error(exception)
      render "/errors/internal_server_error", status: 500, layout: "application", formats: [:html]
    end

    def rescue_not_found(exception)
      render "/errors/not_found", status: 404, layout: "application", formats: [:html]
    end

    def rescue_bad_request(exception)
      render "/errors/bad_request", status: 400, layout: "application", formats: [:html]
    end
end
