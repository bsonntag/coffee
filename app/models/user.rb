class User < ActiveRecord::Base
  after_initialize :default_values

  has_many :drinks

  validates :name, presence: true
  validates :money, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def balance
    money - spent
  end

  def coffees
    drinks.coffees
  end

  def waters
    drinks.waters
  end

  private

  def spent
    drinks.map{ |drink| drink.price }.reduce(0, :+)
  end

  def default_values
    if self.new_record?
      self.money ||= 0
    end
  end
end
