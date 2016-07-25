class Admin::ImagesController < Admin::BaseController

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = "Successfully Created Image"
      redirect_to admin_images_path
    else
      flash.now[:error] = @image.errors.full_messages(', ')
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      flash[:notice] = "Successfully Updated Image!"
      redirect_to admin_image_path(@image)
     else
      flash[:error] = @image.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = "Successfully Deleted Image"
    redirect_to admin_images_path
  end

  private

  def image_params
    params.require(:image).permit(:name, :link)
  end

end
