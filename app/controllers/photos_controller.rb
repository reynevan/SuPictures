class PhotosController < ApplicationController
  @@per_page = 2
  def index
    @photos = Photo.all.page(page_nr).per(@@per_page)
  end
 
  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
    @categories = ['Abstract', 'Food']
  end
 
  def edit
    if user_signed_in?
      @photo = Photo.find(params[:id])
      @categories = ['Abstract', 'Food']
    else
      redirect_to photos_path
    end
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update(photo_params)
      redirect_to photos_path
    else
      render action: 'new', alert: 'Photo could not be created' 
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.delete
    respond_to do |format|
      format.html { }
     format.js { render layout: false }
    end 
  end

  def search
    redirect_to "/search/#{params[:q]}"
  end

  def results
    @photos = Photo.where("lower(tags) like ?", "%#{params[:q].downcase}%").page(page_nr).per(@@per_page)
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to photos_path
    else
      render action: 'new', alert: 'Photo could not be created' 
    end
   end

  def categories
    @photos = Photo.where("lower(category) like ?", "%#{params[:category].downcase}%").page(page_nr).per(@@per_page)
  end

  def download
    @photo = Photo.find(params[:id])

    send_file @photo.image.path,
                :filename => @photo.image_file_name,
                :type => @photo.image_content_type,
                :disposition => 'attachment'
    
  end

  private
    def photo_params
      params.require(:photo).permit(:name, :image, :tags, :category)
    end

    def page_nr
      if params[:page]
        params[:page]
      else 
       1
     end
    end

end