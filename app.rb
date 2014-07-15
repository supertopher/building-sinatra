# Require all the gems in the gemfile
require 'bundler/setup'
Bundler.require(:default)

# Set . to pre-pend the load path
$LOAD_PATH.unshift(File.expand_path('.'))

# Allow the environment to be set by rack
begin
  require 'dotenv'
  Dotenv.load(".env.#{ENV['RACK_ENV']}", ".env")
rescue LoadError
end

# Set the Database to be aware of current environment
set :database, ENV['DATABASE_URL']
ActiveRecord::Base.establish_connection(:adapter => 'postgresql')

# Load All the ruby files in routes and models
['routes', 'models'].each do |directory_to_preload|
  Dir["#{directory_to_preload}/*.rb"].each do |file_to_load|
    require file_to_load
  end
end