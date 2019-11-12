require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end


desc 'Seeds database for testing'
task :seed do
  MySeed.seed
end

desc 'Seeds monsters from Dnd5e API'
task :monsterSeed do
  MonsterSeed.seed
end

desc "run ruby code"
task :run do
  system "ruby ./bin/run.rb"
end

