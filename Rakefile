require 'pg'

task default: %w[create_databases]

task :create_databases do
  puts 'Attempting to setup production database...'
  if !database_exists?('daily_diary')
    create_database('daily_diary')
  else
    puts 'Database already exists...'
  end

  puts 'Attempting to setup test database...'
  if !database_exists?('daily_diary_test')
    create_database('daily_diary_test')
  else
    puts 'Database already exists...'
  end
end

task :clean_test_database do
  if database_exists?('daily_diary_test')
    connection = PG.connect(dbname: 'daily_diary_test')
    connection.exec('TRUNCATE entries;')
  else
    puts 'Test database does not exist. Run rake create_databases to create it...'
  end
end

def database_exists?(database_name)
  connection = PG.connect
  result = connection.exec("SELECT datname FROM pg_catalog.pg_database WHERE datname='#{database_name}';")
  result.ntuples == 1
end

def create_database(database_name)
  puts 'Creating database...'
  connection.exec("CREATE DATABASE #{database_name};")
  connection = PG.connect(dbname: database_name)
  connection.exec('CREATE TABLE entries(id SERIAL PRIMARY KEY, body VARCHAR(1000), title VARCHAR(150), date TIMESTAMP);')
end
