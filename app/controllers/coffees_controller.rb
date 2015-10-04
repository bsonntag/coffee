class CoffeesController < ApplicationController
  def index
    @user = UserService.find(user_id)
    @coffees = DrinkService.coffees_from(@user)
  end

  def create
    user = UserService.find(user_id)
    DrinkService.add_coffee(user)

    respond_to do |format|
      format.html { redirect_to user, notice: 'User was successfully updated.' }
      format.json { render :show, status: :ok, location: user }
    end
  end

  private

  def user_id
    params[:user_id]
  end
end
