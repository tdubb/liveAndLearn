class PhotosController < ApplicationController
  def new
    @listing_id = params[:listing_id]
    @listing = Listing.find(@listing_id)
    @photo = Photo.new
    if @listing.photos.count >= 4
      flash[:warning] = "Only 4 Photos Are Allowed, Please Delete One Before Updating a New Image."
      redirect_to listing_photos_path(@listing)
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def index
    @listing = Listing.find(params[:listing_id])
    @photos = @listing.photos
  end

  def create
    @photo = Photo.new(params.require(:photo).permit(:image))
    @photo.listing_id = params[:photo][:listing_id]
    @photo.save
    redirect_to photo_path(@photo)
  end

end
