class OrderService
  def self.orders_from(user, options)
    orders = user.orders.order(created_at: :desc)
    if options[:product_name]
      filter_orders(orders, options[:product_name])
    else
      orders
    end
  end

  def self.create(user_id, product_id)
    order = Order.new({ user_id: user_id, product_id: product_id })
    order.save
    order
  end

  def self.remove(order_id)
    order = Order.find(order_id)
    order.destroy
    order
  end

  private

  def self.filter_orders(orders, product_name)
    orders.select do |order|
      order.product.name == product_name
    end
  end
end
