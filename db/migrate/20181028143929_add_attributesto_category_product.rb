class AddAttributestoCategoryProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :category_products, :product_id, :integer
    add_column :category_products, :category_id, :integer
  end
end
