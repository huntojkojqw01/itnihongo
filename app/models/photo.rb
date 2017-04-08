class Photo < ApplicationRecord
  mount_uploader :image, PhotoUploader
  belongs_to :album
end
