class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :phone
      t.string :area
      t.string :status
      t.string :address

      t.timestamps
    end
  end
end
