class Supplier < ApplicationRecord
    has_many :products, dependent: :destroy
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
end
