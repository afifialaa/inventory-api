class ProductWarehouseJoinTable < ActiveRecord::Migration[6.1]
	def change

    	create_join_table :product, :warehouses do |t|
        	t.index :product_id
        	t.index :warehouse_id
            t.integer :quantity
		end
  	end
end
