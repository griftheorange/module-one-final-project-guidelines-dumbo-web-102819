class CreateEnvironmentMonsters < ActiveRecord::Migration[5.2]
  def change
    create_table :environment_monsters do |t|
      t.string :name
    end
  end
end
