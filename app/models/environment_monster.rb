class EnvironmentMonster < ActiveRecord::Base
    belongs_to :environment
    belongs_to :monster
end
