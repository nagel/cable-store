class RemoveImageUrLfromCables < ActiveRecord::Migration[5.2]
  def change
    remove_column :cables, :image_url, :string
  end
end
