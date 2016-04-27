class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #2016/02/10 add
  #use Rails::DataMapper::Middleware::IdentityMap
  #2016/02/10 add end

  protect_from_forgery with: :exception
end
