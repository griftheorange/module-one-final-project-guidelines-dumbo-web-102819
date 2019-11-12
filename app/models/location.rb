class Location < ActiveRecord::Base 
    belongs_to :world
    belongs_to :environment
    has_many :environment_monsters, through: :environment
    has_many :monsters, through: :environment_monsters
    has_many :location_monsters
    has_many :monsters, through: :location_monsters
end 