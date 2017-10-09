class User < ApplicationRecord
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  has_one :role
  has_many :books
  
  before_save :encrypt_password
  after_save :clear_password

  validates :user_id, :password, :name, :email, :role_id, presence: true
  validates :is_deleted, inclusion: { in: [true, false] }
  validates :user_id, length: { maximum: 20 }
  validates :password, length: { is: 60 }
  validates :name, :email, length: { maximum: 50 }
  validates :role_id, numericality: { only_integer: true }
  validates :email, email_format: true

  def encrypt_password
    return unless password.present?

    BCrypt::Engine.cost = 12
    self.password = BCrypt::Password.create(password)
  end

  def clear_password
    self.password = nil
  end

  def self.authenticate(username_or_email = "", login_password = "")
    user = if EMAIL_REGEX.match(username_or_email)    
             User.find_by_email(username_or_email)
           else
             User.find_by_username(username_or_email)
           end

    if user && user.match_password(login_password)
      user
    else
      false
    end
  end

  def match_password(login_password = "")
    test = BCrypt::Password.new(password)
    test == login_password
  end

  def self.find_by_email(email)
    User.where(["email = ?", email]).first
  end

  def self.find_by_username(user_name)
    User.where(["user_id = ?", user_name]).first
  end
end
