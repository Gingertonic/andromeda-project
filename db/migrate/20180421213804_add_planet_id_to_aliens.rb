class AddPlanetIdToAliens < ActiveRecord::Migration
  def change
    add_column :aliens, :planet_id, :integer
  end
end
