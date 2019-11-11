class AddChallengeRatingToMonsters < ActiveRecord::Migration[5.2]
  def change
    add_column :monsters, :challenge_rating, :integer
  end
end
