class Monster < ActiveRecord::Base
    has_many :location_monsters
    has_many :locations, through: :location_monsters

    def self.name_is(name)
        Monster.where("name LIKE ?", name)[0]
    end

    def details
        JSON.parse(RestClient.get(self.url))['results'].find{|monster|
            monster['name'] == self.name
        }
    end

    def self.monsters_less_than_or_equal_to_challenge_rating(cr)
        Monster.where("challenge_rating < ?", cr)
    end

    def self.get_all_types
        Monster.select(:monster_type).distinct(:monster_type).map{|monster|
            monster.monster_type.capitalize
        }
    end

    def self.by_type(type)
        Monster.where("monster_type LIKE ?", type)
    end

    def self.by_cr(cr)
        Monster.where("challenge_rating = ?", cr)
    end
end