class Film < ActiveRecord::Base
  belongs_to :user
  belongs_to :genre

  has_many :films_images
  has_many :images, through: :films_images

  validates :title, presence: true
  validates :description, presence: true
end
