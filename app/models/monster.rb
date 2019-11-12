class Monster < ActiveRecord::Base
    has_many :environment_monsters
    has_many :environments, through: :environment_monsters
    has_many :location_monsters
    has_many :locations, through: :location_monsters

    def self.name_is(name)
        Monster.where("name = ?", name)
    end

    def details
        JSON.parse(RestClient.get(self.url))
    end
end