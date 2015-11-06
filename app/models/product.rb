class Product < ActiveRecord::Base
  has_many :orders

  validates :name, :category, :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
