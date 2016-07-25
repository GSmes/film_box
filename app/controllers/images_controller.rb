class ImagesController < ApplicationController

  def new
    @images = Image.all
  end

  def create
    film = Idea.find(params[:film_id])
    image = Image.find(params[:image_id])
    film.images.create(name: image.name, link: image.link)
    redirect_to film_path(film)
  end

end
