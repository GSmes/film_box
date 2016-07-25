class IdeasController < ApplicationController
  before_action :set_user
  before_action :set_film, only: [:show, :destroy, :edit, :update]

  def index
    @films = @user.films
  end

  def new
    @film = @user.films.new
  end

  def create
    @film = @user.films.new(film_params)
    if @film.save
      flash[:notice] = "Successfully Created Film!"
      redirect_to @film
    else
      flash[:error] = @film.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
  end

  def destroy
    @film.destroy
    flash[:notice] = "Successfully Deleted Film"
    redirect_to films_path
  end

  def edit
  end

  def update
    if @film.update(film_params)
      flash[:notice] = "Successfully Updated Film!"
      redirect_to @film
    else
      flash[:error] = @film.errors.full_messages.join(', ')
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end

  def set_film
    @film = Film.find(params[:id])
  end

  def film_params
    params.require(:film).permit(:title, :description, :genre_id)
  end

end
