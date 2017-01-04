class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :model
      t.integer :count
      t.string :serial
      t.float :price
      t.string :description

      t.timestamps
    end
  end
end
