class ApplicationController < ActionController::API
  acts_as_token_authentication_handler_for User
  
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end
end
