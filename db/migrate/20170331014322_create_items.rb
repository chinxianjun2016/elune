class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :number
      t.string :unit
      t.string :model
      t.float :price

      t.timestamps
    end
  end
end
