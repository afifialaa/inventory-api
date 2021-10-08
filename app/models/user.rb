class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: {message: "Email is already register"}, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }, length: {minimum:6}
end
