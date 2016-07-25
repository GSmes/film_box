class Admin::GenresController < Admin::BaseController
  before_action :set_genre, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    if @genre.update(genre_params)
      flash[:notice] = "Successfully Updated Genre"
      redirect_to admin_genres_path
    else
      flash.now[:error] = @genre.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @genre.destroy
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end

end
