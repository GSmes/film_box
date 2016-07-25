class FilmsImage < ActiveRecord::Base
  belongs_to :film
  belongs_to :image
end
