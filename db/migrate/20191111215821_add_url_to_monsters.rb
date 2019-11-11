class AddUrlToMonsters < ActiveRecord::Migration[5.2]
  def change
    add_column :monsters, :url, :string
  end
end
