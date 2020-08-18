class User < ApplicationRecord
    has_many :microposts
    before_save { email.downcase! }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, length: { maximum: 255 }
    validates :name, length: { maximum: 50 }, presence: true, uniqueness: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    class << self
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    # Returns a random token.
    def new_token
        SecureRandom.urlsafe_base64
    end
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end
    # Returns true if the given token matches the digest.
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # Forgets a user.
    def forget
        update_attribute(:remember_digest, nil)
    end
end
