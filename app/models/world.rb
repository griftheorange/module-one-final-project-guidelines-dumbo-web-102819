class World < ActiveRecord::Base 
    belongs_to :story
    has_many :locations
end 