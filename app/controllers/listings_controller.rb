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
  end
end
