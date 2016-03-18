require 'jwt'

class SessionsController < ApplicationController
  def new
  end

  def create
    @user = SessionService.login(params[:email], params[:password])
    if @user
      respond_to do |format|
        format.html { redirect_to user_url(@user), notice: 'Welcome!' }
        format.json { render :show, location: @user }
      end
    else
      redirect_to login_url
    end
  end
end
