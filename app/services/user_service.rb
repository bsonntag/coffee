class UserService
  def self.all
    User.all
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    user && user.authenticate(password)
  end

  def self.find(user_id)
    User.find(user_id)
  end

  def self.new
    User.new
  end

  def self.create(user_params)
    user = User.new(user_params)
    user.save
    user
  end

  def self.update(user, user_params)
    user.update(user_params)
    user
  end

  def self.add_money(user, money)
    user.money += money
    user.save
    user
  end

  def self.remove(user)
    user.destroy
    user
  end
end
