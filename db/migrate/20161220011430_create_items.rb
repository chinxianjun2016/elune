class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :model
      t.integer :count
      t.string :serial
      t.float :price
      t.string :description
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
