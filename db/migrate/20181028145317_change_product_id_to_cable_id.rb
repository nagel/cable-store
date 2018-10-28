class ChangeProductIdToCableId < ActiveRecord::Migration[5.2]
  def change
    rename_column :category_products, :product_id, :cable_id
  end
end
