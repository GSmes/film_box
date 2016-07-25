class Admin::GenresController < Admin::BaseController

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "Successfully Created Genre"
      redirect_to admin_genres_path
    else
      flash.now[:error] = @genre.errors.full_messages(', ')
      render :new
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
