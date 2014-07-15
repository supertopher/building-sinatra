$LOAD_PATH.unshift(File.expand_path('.'))

require 'app'

desc "migrate the database"
  task :migrate do
    ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
    ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths)
  end