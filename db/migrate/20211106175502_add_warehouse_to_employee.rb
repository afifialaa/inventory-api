class AddWarehouseToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_reference :employees, :warehouse, foreign_key: true
  end
end
