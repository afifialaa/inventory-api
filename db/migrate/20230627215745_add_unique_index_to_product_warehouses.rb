class AddUniqueIndexToProductWarehouses < ActiveRecord::Migration[6.1]
    def change
        add_index :product_warehouses, [:product_id, :warehouse_id], unique: true
    end
end
