class CreateCables < ActiveRecord::Migration[5.2]
  def change
    create_table :cables do |t|
      t.string :name
      t.integer :price
      t.string :length
      t.string :function
      t.integer :model_year
      t.string :image_url
      t.string :description

      t.timestamps
    end
  end
end
