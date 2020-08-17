class User < ApplicationRecord
    has_many :microposts
    before_save { email.downcase! }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, length: { maximum: 255 }
    validates :name, length: { maximum: 50 }, presence: true, uniqueness: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
