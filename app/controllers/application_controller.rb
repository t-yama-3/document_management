class ApplicationController < ActionController::Base
  # headers 'X-Frame-Options', 'ALLOWALL'
  # present result
  # response.headers['X-Frame-Options'] = 'ALLOWALL'
  # response.headers['X-Frame-Options'] = 'ALLOW-FROM http://example.com'
  before_action :basic_auth, if: :production?
  before_action :configure_permited_parameters, if: :devise_controller?
  
  protected
  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  private
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
