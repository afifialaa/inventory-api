class Customer < ApplicationRecord
    has_many :orders
    validates :email, presence: true, uniqueness: {message: "Email is already registered"}
end
