class RemoveCableIdAndQuantityFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :cable_id, :integer
    remove_column :orders, :quantity, :integer
  end
end
