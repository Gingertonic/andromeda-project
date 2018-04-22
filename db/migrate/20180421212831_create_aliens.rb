class CreateAliens < ActiveRecord::Migration
  def change
    create_table :aliens do |t|
      t.string :name
      t.string :classification
      t.text :description
    end
  end
end
