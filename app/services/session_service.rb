require 'jwt'

class SessionService
  def self.login(email, password)
    user = UserService.authenticate(email, password)
    if user
      user.token = JWT.encode(user.slice(:id, :email), SECRET, 'HS256')
      user
    end
  end

  def self.validate(token)
    return if token.nil?
    decoded = JWT.decode(token, SECRET, 'HS256')
    if decoded
      get_user(decoded.first)
    end
  end

  private

  def self.get_user(token)
    UserService.find(token['id']) if token && token['id']
  end
end
