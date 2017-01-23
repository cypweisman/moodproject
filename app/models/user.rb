class User < ActiveRecord::Base
  validates :username, :email, presence: true, uniqueness: true
  validate :password_length

  # Authentication methods
  MIN_LENGTH = 4
  MAX_LENGTH = 25

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(given_password)
    @plain_text_password = given_password
    @password = BCrypt::Password.create(given_password)
    self.password_hash = @password
  end

  def authenticate(given_password)
    self.password == given_password
  end

  def password_length
    if @plain_text_password.length < MIN_LENGTH || @plain_text_password.length > MAX_LENGTH
      errors.add(:password, "must be between 4 and 25 letters long")
    end
  end
end
