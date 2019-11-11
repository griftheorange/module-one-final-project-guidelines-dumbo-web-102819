class Monster < ActiveRecord::Base
    has_many :environments, through: :environment_monsters
end