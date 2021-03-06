class OrdersController < ApplicationController
  def index
    @user = UserService.find(user_id)
    @orders = OrderService.orders_from(@user, { product_name: params[:filter] })
  end

  def show
    respond_to do |format|
      format.html { redirect_to user_orders_url }
      format.json do
        @user = UserService.find(user_id)
        @order = OrderService.find(@user, order_id)
        format.json { render :show }
      end
    end
  end

  def create
    user = UserService.find(user_id)
    order = OrderService.create(user_id, product_id)

    respond_to do |format|
      if order.persisted?
        format.html { redirect_to user, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: order }
      else
        format.html { redirect_to user, notice: 'Error creating order.' }
        format.json { render json: order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    OrderService.remove(order_id)

    respond_to do |format|
      format.html { redirect_to user_orders_url, notice: 'Order was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def order_id
    params[:id]
  end

  def user_id
    params[:user_id]
  end

  def product_id
    params[:order][:product_id]
  end
end
