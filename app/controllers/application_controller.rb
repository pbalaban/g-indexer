class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate

  protected
  def authenticate
    return unless Settings.basic_auth.enabled

    authenticate_or_request_with_http_basic do |username, password|
      username == Settings.basic_auth.login && password == Settings.basic_auth.password
    end
  end
end
