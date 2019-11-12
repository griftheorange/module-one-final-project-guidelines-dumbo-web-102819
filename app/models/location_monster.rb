class LocationMonster < ActiveRecord::Base
    belongs_to :location
    belongs_to :monster
end