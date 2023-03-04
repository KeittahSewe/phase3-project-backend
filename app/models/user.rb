class Task < ActiveRecord::Base
    # validates :full_name, :email, :password_digest, presence: true
    # validates :email, uniqueness: true
    # validates :email,
  
    has_secure_password
end
