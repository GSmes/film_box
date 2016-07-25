require 'test_helper'

class FilmTest < ActiveSupport::TestCase

  test "film is valid" do
    film = Film.new(title: 'Forrest Gump', description: 'Life is like a box of chocolates')

    assert film.valid?
  end

  test 'film must have a title' do
    film = Film.new(description: 'Life is like a box of chocolates')

    refute film.valid?
  end

  test 'film must have a description' do
    film = Film.new(title: 'Forrest Gump')

    refute film.valid?
  end

end
