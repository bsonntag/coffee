class DrinkService
  def self.drinks_from(user)
    user.drinks.order(created_at: :desc)
  end

  def self.add_drink(user, drink_params)
    case drink_params[:category]
    when 'coffee'
      add_coffee(user)
    when 'water'
      add_water(user)
    end
  end

  def self.add_coffee(user)
    coffee = Drink.new({ user: user, price: 40, category: 'coffee' })
    coffee.save
  end

  def self.add_water(user)
    coffee = Drink.new({ user: user, price: 20, category: 'water' })
    coffee.save
  end

  def self.remove(coffee_id)
    coffee = Drink.find(coffee_id)
    coffee.destroy
    coffee
  end
end
