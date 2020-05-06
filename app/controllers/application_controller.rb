class ApplicationController < ActionController::Base
  # headers 'X-Frame-Options', 'ALLOWALL'
  # present result
  # response.headers['X-Frame-Options'] = 'ALLOWALL'
  # response.headers['X-Frame-Options'] = 'ALLOW-FROM http://example.com'
  before_action :configure_permited_parameters, if: :devise_controller?
  protected
  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
