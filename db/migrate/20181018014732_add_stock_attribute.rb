class AddStockAttribute < ActiveRecord::Migration[5.2]
  def change
    add_column :cables, :in_stock, :boolean
  end
end
