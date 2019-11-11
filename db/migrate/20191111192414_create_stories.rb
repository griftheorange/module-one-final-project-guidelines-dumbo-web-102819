class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :story_name
      t.integer :user_id
      t.text :description
    end
  end
end