#anything related to http without browser interface
require_relative '../test_helper'
require 'json'

class CreateGenreTest < Minitest::Test
  include Rack::Test::Methods #will get post, get, etc.

  def app     # def app is something that Rack::Test is looking for, won't run without it
   FilmFile
  end

  def setup
    DatabaseCleaner.start
    super
  end

  def teardown
    DatabaseCleaner.clean
    super
  end

  def test_create_a_genre_with_valid_attributes
    # post '/genres', {"genre: {\"name\: \"Cartoon\"}"} #other way to do it
    post '/genres', {genre: {name: "Cartoon"}.to_json}
    assert_equal 1, Genre.count
    assert_equal 200, last_response.status
    assert_equal "Genre created.", last_response.body #last response is a rack thing
  end

  def test_create_a_genre_with_invalid_attributes
    post '/genres', {genre: {name: ""}.to_json} #{"genre"=>"{}"}
    assert_equal 0, Genre.count
    assert_equal 400, last_response.status
    assert_equal "Name can't be blank", last_response.body
  end

end
