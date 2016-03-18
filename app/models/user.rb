class User < ActiveRecord::Base
  has_secure_password

  after_initialize :default_values

  attr_accessor :token

  has_many :orders

  validates :name, :email, presence: true
  validates :email, uniqueness: true
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
