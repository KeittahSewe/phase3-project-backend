class User < ActiveRecord::Base
    validates :full_name, :email, :password_digest, presence: true
    validates :email, uniqueness: true

    has_secure_password
end
