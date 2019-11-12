class Monster < ActiveRecord::Base
    has_many :location_monsters
    has_many :locations, through: :location_monsters

    def self.name_is(name)
        Monster.where("name = ?", name)
    end

    def details
        JSON.parse(RestClient.get(self.url))
    end

    def self.monsters_less_than_or_equal_to_challenge_rating(cr)
        Monster.where("challenge_rating < ?", cr)
    end

    def self.get_all_types
        Monster.select(:monster_type).distinct(:type)
    end

    def self.monsters_by_type(type)
        Monster.where(monster_type: type)
    end
end