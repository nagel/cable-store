class AddVendorIdToCables < ActiveRecord::Migration[5.2]
  def change
    add_column :cables, :vendor_id, :integer
  end
end
