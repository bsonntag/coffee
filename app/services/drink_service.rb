class DrinkService
  def self.coffees_from(user)
    user.coffees.order(created_at: :desc)
  end

  def self.add_coffee(user)
    coffee = Drink.new({ user: user, price: 40, category: 'coffee' })
    coffee.save
  end

  def self.remove(coffee_id)
    coffee = Drink.find(coffee_id)
    coffee.destroy
    coffee
  end
end
