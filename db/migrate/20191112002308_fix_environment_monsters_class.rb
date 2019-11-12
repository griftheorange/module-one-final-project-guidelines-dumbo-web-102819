class FixEnvironmentMonstersClass < ActiveRecord::Migration[5.2]
  def change
    remove_column :environment_monsters, :name
    add_column :environment_monsters, :environment_id, :integer
    add_column :environment_monsters, :monster_id, :integer
  end
end
