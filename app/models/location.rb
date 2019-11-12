class Location < ActiveRecord::Base 
    belongs_to :world
    belongs_to :environment
    has_many :monster_locations
    has_many :monsters, through: :monster_locations
end 