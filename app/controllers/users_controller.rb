class UsersController < ApplicationController
  def index
    @users = UserService.all
    authorize! :read, User
  end

  def show
    @user = UserService.find(user_id)
    @products = ProductService.all
    authorize! :read, @user
  end

  def new
    @user = UserService.new
    authorize! :create, @user
  end

  def create
    @user = UserService.create(user_params)
    authorize! :create, @user

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
    authorize! :update, @user
  end

  def update
    @user = UserService.find(user_id)
    authorize! :update, @user
    @user = UserService.update(@user, user_params)

    respond_to do |format|
      if @user.valid?
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_money
    @user = UserService.find(user_id)
    authorize! :update, @user
    @user = UserService.add_money(@user, user_params[:money].to_i)

    respond_to do |format|
      format.html { redirect_to @user, notice: 'User was successfully updated.' }
      format.json { render :show, status: :ok, location: @user }
    end
  end

  private

  def user_id
    params[:id]
  end

  def user_params
    params.require(:user)
      .permit(:name, :email, :money, :password, :password_confirmation)
  end
end
