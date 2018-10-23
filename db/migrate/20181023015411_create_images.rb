uclass CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.text :url
      t.string :cable_id
      t.string :integer

      t.timestamps
    end
  end
end
