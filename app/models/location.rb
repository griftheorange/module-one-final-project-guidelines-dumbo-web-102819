class Location < ActiveRecord::Base 
    belongs_to :world
    belongs_to :environment
    has_many :environment_monsters, through: :environment
    has_many :monsters, through: :environment_monsters
end 