class AddSubtypeAndAlignmentToMonsters < ActiveRecord::Migration[5.2]
  def change
    add_column :monsters, :sub_type , :string
    add_column :monsters, :alignment, :string
  end
end
