class User < ApplicationRecord
    has_secure_password
    enum role: { admin: 0, dealer: 1 }
  
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    def valid_password?(password)
      BCrypt::Password.new(password_digest) == password
    end
  end
