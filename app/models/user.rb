class User < ActiveRecord::Base
    has_many :stories
    has_many :worlds, through: :stories
    has_many :locations, through: :worlds
end 