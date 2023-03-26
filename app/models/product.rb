class Product < ApplicationRecord
    belongs_to :supplier

    has_many :order_details

    validates :name, presence: true, :uniqueness => {:message => "Product with same name already exists"}
    validates :quantity, presence: true, numericality: { only_integer: true}
    validates :price, presence: true, numericality: true
    validates :supplier_id, presence: true
end
