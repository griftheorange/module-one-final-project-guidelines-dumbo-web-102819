class ChangeChallengeRatingToFloat < ActiveRecord::Migration[5.2]
  def change
    remove_column :monsters, :challenge_rating
    add_column :monsters, :challenge_rating, :float
  end
end
