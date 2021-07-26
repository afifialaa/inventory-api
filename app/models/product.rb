class Product < ApplicationRecord
    belongs_to :supplier
    validates :name, presence: true
    validates :quantity, presence: true
    validates :supplier_id, presence: true
end
