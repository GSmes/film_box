class AddGenreIdToFilms < ActiveRecord::Migration
  def change
    add_reference :films, :genre, index: true, foreign_key: true
  end
end
