class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :phone
      t.string :tel
      t.string :note
      t.string :area
      t.string :address
      t.integer :status

      t.timestamps
    end
  end
end
