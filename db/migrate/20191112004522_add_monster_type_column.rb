class AddMonsterTypeColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :monsters, :monster_type, :string
  end
end
