class ProductWarehouse < ApplicationRecord
    belongs_to :product
    belongs_to :warehouse

    validates :product_id, presence: true
    validates :warehouse_id, presence: true
    validates :quantity, presence: true

    validates :product_id, uniqueness: { scope: :warehouse_id, :message => "Recored already exists"}
end
