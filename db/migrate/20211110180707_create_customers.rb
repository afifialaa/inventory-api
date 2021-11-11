class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :email, null: false, index: {unique: true}
      t.timestamps
    end
  end
end
