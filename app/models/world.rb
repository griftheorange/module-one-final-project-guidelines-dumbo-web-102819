class World < ActiveRecord::Base 
    belongs_to :story
    has_many :locations
    has_many :environments, through: :locations
    has_many :environment_monsters, through: :environments
    has_many :monsters, through: :environment_monsters
end 