class AddIdToProductWarehouses < ActiveRecord::Migration[6.1]
  def change
    add_column :product_warehouses, :id, :primary_key
  end
end
