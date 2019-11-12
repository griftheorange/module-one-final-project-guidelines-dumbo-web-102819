class Story < ActiveRecord::Base
    belongs_to :user
    has_many :worlds, dependent: :destroy
    has_many :locations, through: :worlds
    has_many :environments, through: :locations
    has_many :environment_monsters, through: :environments
    has_many :monsters, through: :environment_monsters
end 