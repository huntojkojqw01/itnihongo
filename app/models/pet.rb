class Pet < ApplicationRecord
	mount_uploader :avatar, PhotoUploader
  belongs_to :user
  belongs_to :kind
  has_many :albums, dependent: :destroy
  has_many :photos, through: :albums
  has_many :follows, dependent: :destroy
  has_many :users, through: :follows
  validates :name, presence: true, uniqueness: true
end
