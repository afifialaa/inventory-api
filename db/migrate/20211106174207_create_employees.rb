class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.integer :position, null: false
      t.string :phone

      t.timestamps
    end
  end
end
