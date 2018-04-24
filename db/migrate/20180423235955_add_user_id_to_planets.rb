class AddUserIdToPlanets < ActiveRecord::Migration
  def change
    add_column :planets, :user_id, :integer
  end
end
