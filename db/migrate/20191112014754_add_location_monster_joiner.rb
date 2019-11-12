class AddLocationMonsterJoiner < ActiveRecord::Migration[5.2]
  def change
    create_table :location_monsters do |t|
      t.integer :location_id
      t.integer :monster_id
    end
  end
end
