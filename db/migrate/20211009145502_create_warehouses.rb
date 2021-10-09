class CreateWarehouses < ActiveRecord::Migration[6.1]
  def change
    create_table :warehouses do |t|
		t.string :name, null: false
		t.string :address
		t.string :phone_number
		t.string :email
		t.integer :manager_id
		t.integer :total_capacity
		t.integer :occupied_capacity

      t.timestamps
    end
  end
end
