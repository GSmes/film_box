class Image < ActiveRecord::Base
  has_many :films_image
  has_many :films, through: :films_image
end
