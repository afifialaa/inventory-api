class AddProductToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_reference :order_details, :product, foreign_key: true
  end
end
