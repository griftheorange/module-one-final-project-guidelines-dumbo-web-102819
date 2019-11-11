class Location < ActiveRecord::Base 
    belongs_to :world
    belongs_to :environment
end 