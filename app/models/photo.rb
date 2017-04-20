class Photo < ApplicationRecord
  mount_uploader :image, PhotoUploader
  belongs_to :album
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many :comments, dependent: :destroy
end
