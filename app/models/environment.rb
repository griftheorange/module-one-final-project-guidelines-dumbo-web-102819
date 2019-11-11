class Environment < ActiveRecord::Base
    has_many :locations
    has_many :monsters, through: :environment_monsters
end