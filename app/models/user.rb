class User < ActiveRecord::Base
  after_initialize :default_values

  validates :name, presence: true
  validates :coffees, :money, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def balance
    money - (coffees * 40)
  end

  private

  def default_values
    if self.new_record?
      self.coffees ||= 0
      self.money ||= 0
    end
  end
end
