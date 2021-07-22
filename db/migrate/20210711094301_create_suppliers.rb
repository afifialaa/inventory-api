class CreateSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_table :suppliers do |t|
        t.string :email, null: false, index: {unique: true}
        t.string :name, null: false
        t.string :phone
        t.string :address
        t.string :field

        t.timestamps
    end
  end
end
