require 'test_helper'

class GenreTest < ActiveSupport::TestCase

  test "genre is valid" do
    genre = Genre.new(name: 'Horror')

    assert genre.valid?
  end

  test 'genre must have a name' do
    genre = Genre.new({})

    refute genre.valid?
  end

end
