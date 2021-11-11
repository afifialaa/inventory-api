class Customer < ApplicationRecord
    validates :email, presence: true, uniqueness: {message: "Email is already registered"}
end
