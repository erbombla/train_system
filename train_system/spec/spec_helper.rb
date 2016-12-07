require("rspec")
require("pg")
require 'pry'
require 'trains'
require 'city'

DB = PG.connect({dbname: 'train_system_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM trains *;")
    DB.exec("DELETE FROM city *;")
  end
end 
