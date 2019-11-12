class Environment < ActiveRecord::Base
    has_many :locations
    has_many :environment_monsters
    has_many :monsters, through: :environment_monsters

    def add_random_monster_to_environment
        EnvironmentMonster.create(environment_id: self.id, monster_id: Monster.all.sample.id)
    end

end