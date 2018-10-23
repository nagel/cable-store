class ChangeCableIdToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :images, :cable_id, :integer
  end
end
