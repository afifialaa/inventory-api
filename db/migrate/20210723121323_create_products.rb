class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :description
      t.integer :quantity, null: false
      t.decimal :price, null: false
      t.integer :status

      t.timestamps
    end
  end
end
