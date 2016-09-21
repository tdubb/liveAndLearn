class Photo < ApplicationRecord
  attr_accessor :image, :remote_image_url
  mount_uploader :image, ImageUploader
  belongs_to :listing
end
