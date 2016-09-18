class ListingsController < ApplicationController

  def index
    if params[:user_id]
      @listings = User.find(params[:user_id]).listings
    else
      @listings = Listing.all
    end
  end

  def show
    # @listing = Listing.find(params[:id])
    @listings = Listing.all
  end

  def new
    @listing = Listing.new(user_id: params[:user_id])
  end

  def create
    @listing = Listing.new(params.require(:listing).permit(:title, :body, :email, :phone))
    @listing.user_id = current_user.id
    @listing.save
    redirect_to user_listings_path(current_user)
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

  def listings_params
    params.permit(:title, :body, :email, :phone)
  end
end
