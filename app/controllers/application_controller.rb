require 'jwt'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  rescue_from CanCan::AccessDenied do |exception|
    puts exception.message
    respond_to do |format|
      format.html { redirect_to login_url, notice: 'Please login first' }
      format.json { render json: { message: exception.message }, status: :unauthorized }
    end
  end

  def current_user
    @current_user = SessionService.validate(auth_token)
  end

  helper_method :current_user

  private

  def auth_token
    authorization = request.headers['Authorization']
    if !authorization.nil? && authorization.start_with?('Bearer')
      authorization.split(' ').last
    end
  end
end
