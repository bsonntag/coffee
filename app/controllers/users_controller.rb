class UsersController < ApplicationController
  def index
    @users = UserService.all
  end

  def show
    @user = UserService.find(user_id)
  end

  def new
    @user = UserService.new
  end

  def create
    @user = UserService.create(user_params)

    respond_to do |format|
      if @user.persisted?
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = UserService.find(user_id)
  end

  def update
    @user = UserService.update(user_id, user_params)

    respond_to do |format|
      if @user.persisted?
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_coffee
    @user = UserService.add_coffee(user_id)

    respond_to do |format|
      if @user.persisted?
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_money
    @user = UserService.add_money(user_id, user_params[:money].to_i)

    respond_to do |format|
      if @user.persisted?
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_id
    params[:id]
  end

  def user_params
    params.require(:user).permit(:name, :coffees, :money)
  end
end
