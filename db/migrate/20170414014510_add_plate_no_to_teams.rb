class AddPlateNoToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :plate_no, :string
  end
end
