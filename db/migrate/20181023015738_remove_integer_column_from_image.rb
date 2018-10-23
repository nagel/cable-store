class RemoveIntegerColumnFromImage < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :integer, :string
  end
end
