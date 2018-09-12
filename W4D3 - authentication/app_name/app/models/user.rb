class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :session_token, presence: { message: 'Password cant be blank'}
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true}
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.find_by_credentials(username, password)
    #password_digest is from Password.create, plug it into Password.new and you can compare with is_password
    user = User.find_by(username: username)
    return user if user && BCrypt::Password.new(user.password_digest).is_password?(password)
  end

  def self.generate_session_token

  end

  def reset_session_token!

  end

  def ensure_session_token

  end



end
