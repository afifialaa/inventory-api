class Supplier < ApplicationRecord
    has_many :products, dependent: :destroy
    validates :email, presence: true, uniqueness: {message: "Email is already registered"}, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }, length: {minimum:6}
    validates :name, presence: true, uniqueness: {message: "Name already taken"}
    validates :phone, presence: true
    validates :address, presence: true
    validates :field, presence: true
end
