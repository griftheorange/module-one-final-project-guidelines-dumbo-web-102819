require 'bundler'
Bundler.require

require 'require_all'
require 'rest_client'
require_relative '../app/models/location_monster.rb'
require_relative '../app/models/user.rb'
require_relative '../app/models/story.rb'
require_relative '../app/models/location.rb'
require_relative '../app/models/world.rb'
require_relative '../app/models/monster.rb'
require_relative '../app/models/interface.rb'
require_relative './monster_seed.rb'
require_relative './seed.rb'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
# require_all '../lib'

ActiveRecord::Base.logger = nil
