class Location < ActiveRecord::Base 
    belongs_to :world
    has_many :location_monsters
    has_many :monsters, through: :location_monsters

    def add_random_monster_to_location
        LocationMonster.create(location_id: self.id, monster_id: Monster.all.sample.id)
    end

    def all_monsters
        self.monsters + (environment.monsters)
    end
end 