class DrinksController < ApplicationController
  def index
    @user = UserService.find(user_id)
    @drinks = DrinkService.drinks_from(@user)
  end

  def create
    user = UserService.find(user_id)
    DrinkService.add_drink(user, drink_params)

    respond_to do |format|
      format.html { redirect_to user, notice: 'User was successfully updated.' }
      format.json { render :show, status: :ok, location: user }
    end
  end

  def destroy
    drink = DrinkService.remove(drink_id)
    redirect_to user_drinks_url(drink.user)
  end

  private

  def user_id
    params[:user_id]
  end

  def drink_id
    params[:id]
  end

  def drink_params
    params.require(:drink).permit(:category)
  end
end
