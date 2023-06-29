class AddQuantityToProductsWarehouses < ActiveRecord::Migration[6.1]
  def change
    add_column :product_warehouses, :quantity, :integer
  end
end
