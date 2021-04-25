class ApplicationController < ActionController::Base
  #before_action :authenticate_user! #, only: [:/]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
      #username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :encrypted_password, :j_name, :j_k_name, :j_k_n_name, :j_k_n_c_name, :birthday ])
    #devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :encrypted_password])
  end
end
