class ChangeDescriptionToText < ActiveRecord::Migration[5.2]
  def change
    change_column :cables, :description, :text
  end
end
