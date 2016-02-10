require 'json'

class FilmFile < Sinatra::Base

  get '/films' do
    @films = Film.all
    erb :films_index
  end

  get '/genres' do
    @genres = Genre.all
    erb :genres_index
  end

  get '/directors' do
    @directors = Director.all
    erb :directors_index
  end

  get '/directors/:id' do
    @director = Director.find(3)
    erb :director_films
  end

  post '/genres' do
    # status, body = GenreParser.new(params[:genre]) #rather have this than the if/else we have here. Refactor it after you build.
    #would place in models 
    # status(status)
    # body(body)
    data = JSON.parse(params[:genre]) #parse in as json, convert to ruby
    genre = Genre.new(data) # get parameters, Genre.create(data) doesn't work if we cannot create Genre
    if genre.save #save allows us to use .errors object
      "Genre created." #makes it body implicitly, need to have validation or else it won't get 400 status
    else
      # require "pry"; binding.pry
      status 400
      body genre.errors.full_messages.join(", ")
    end
  end

end
