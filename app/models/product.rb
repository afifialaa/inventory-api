class Product < ApplicationRecord
    belongs_to :supplier
    validates :name, presence: true
    validates :quantity, presence: true, numericality: { only_integer: true}
    validates :price, presence: true, numericality: true
    validates :supplier_id, presence: true
end
