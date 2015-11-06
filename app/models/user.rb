class User < ActiveRecord::Base
  after_initialize :default_values

  has_many :orders

  validates :name, presence: true
  validates :money, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def credit
    money - spent
  end

  private

  def spent
    orders.map{ |order| order.product.price }.reduce(0, :+)
  end

  def default_values
    if self.new_record?
      self.money ||= 0
    end
  end
end
