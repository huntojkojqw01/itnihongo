class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  mount_uploader :avatar, PhotoUploader
  has_many :pets, dependent: :destroy
  has_many :following_pets, through: :follows, source: :pet
  has_many :albums, through: :pets
  has_many :photos, through: :albums
  has_many :comments, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :following_photos, through: :follows, source: :photos, dependent: :destroy
  def followed? pet
  	return following_pets.include? pet
  end
  def is_owner? pet
  	return pets.include? pet
  end
end
