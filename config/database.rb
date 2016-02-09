# set the database based on the current environment
database_name = "film-file-#{FilmFile.environment}" #test or dev, based on envt running in

# connect ActiveRecord with the current database
ActiveRecord::Base.establish_connection( #sets up databases
  :adapter  => "sqlite3",
  :database => "db/#{database_name}",
)
