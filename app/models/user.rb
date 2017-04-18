class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, PhotoUploader
  has_many :pets, dependent: :destroy
  has_many :albums, through: :pets
  has_many :photos, through: :albums
end
