class User < ApplicationRecord
  # ["id", "email", "encrypted_password", "reset_password_token", "reset_password_sent_at", "remember_created_at", "sign_in_count", "current_sign_in_at", "last_sign_in_at", "current_sign_in_ip", "last_sign_in_ip", "first_name", "last_name", "gender", "avatar", "birthday", "address", "other_info", "created_at", "updated_at", "locale", "confirmation_token", "confirmed_at", "confirmation_sent_at", "unconfirmed_email", "provider", "uid"]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:facebook]
  mount_uploader :avatar, PhotoUploader
  has_many :pets, dependent: :destroy
  has_many :following_pets, through: :follows, source: :pet
  has_many :albums, through: :pets
  has_many :photos, through: :albums
  has_many :comments, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :following_photos, through: :follows, source: :photos, dependent: :destroy
  validates :first_name,:last_name, presence: true
  
  def followed? pet
  	return following_pets.include? pet
  end
  def is_owner? pet
  	return pets.include? pet
  end
  def self.from_omniauth(auth)    
    if self.where(email: auth.info.email).exists?
      return_user = self.where(email: auth.info.email).first
      return_user.provider = auth.provider
      return_user.uid = auth.uid
    else
      return_user = self.create do |user|
         user.provider = auth.provider
         user.uid = auth.uid
         user.first_name = auth.info.first_name||"first"
         user.last_name = auth.info.last_name||"last"        
         user.email = auth.info.email                  
         user.password = "123456"
         user.skip_confirmation!
      end
    end
    return_user
  end
end
