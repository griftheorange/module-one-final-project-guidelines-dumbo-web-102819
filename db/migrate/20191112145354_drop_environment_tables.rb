class DropEnvironmentTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :environments
    drop_table :environment_monsters
    remove_column :locations, :environment_id
  end
end
