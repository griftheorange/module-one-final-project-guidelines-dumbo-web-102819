class World < ActiveRecord::Base 
    belongs_to :story
    has_many :locations
    has_many :environments, through: :locations
end 