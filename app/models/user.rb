class User < ActiveRecord::Base
    has_many :stories, dependent: :destroy
    has_many :worlds, through: :stories
    has_many :locations, through: :worlds
end 