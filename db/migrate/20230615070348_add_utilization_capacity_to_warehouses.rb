class AddUtilizationCapacityToWarehouses < ActiveRecord::Migration[6.1]
  def change
    add_column :warehouses, :utilization_capacity, :integer
  end
end
