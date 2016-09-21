class ListingsController < ApplicationController


  def index
    if params[:user_id]
      @listings = User.find(params[:user_id]).listings
    else
      @listings = Listing.all
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @photos = @listing.photos
  end

  def new
    @listing = Listing.new(user_id: params[:user_id])
  end

  def create
    @listing = Listing.new(params.require(:listing).permit(:title, :body, :email, :phone, :description))
    @listing.user_id = current_user.id
    @listing.save
    create_photo
    redirect_to user_listing_path(current_user, @listing)
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    respond_to do |f|
      f.html { redirect_to :back }
      f.json {render json: "success"}
    end
  end

  private

  def create_photo
    if params[:listing][:image]
      @photo = Photo.new(image: params[:listing][:image])
      @photo.listing_id = @listing.id
      @photo.save
    end
  end
  # def listings_params
  #   params.require(:listing).permit(:title, :body, :email, :phone, :description)
  # end
  #
  # def photos_params
  #   params.require(:listing).permit(:avatars)
  # end
end
