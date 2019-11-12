class AddEnvironmentIdToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :environment_id, :integer
  end
end
