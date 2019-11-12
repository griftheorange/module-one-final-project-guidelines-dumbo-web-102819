class User < ActiveRecord::Base
    has_many :stories
    has_many :worlds, through: :stories
    has_many :locations, through: :worlds
    has_many :environments, through: :locations
    has_many :environment_monsters, through: :environments
    has_many :monsters, through: :environment_monsters
end 