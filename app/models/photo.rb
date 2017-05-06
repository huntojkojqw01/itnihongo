class Photo < ApplicationRecord
  # ["id", "image", "album_id", "caption", "created_at", "updated_at"]
  include PgSearch
  multisearchable :against => :caption
  mount_uploader :image, PhotoUploader
  belongs_to :album 
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many :comments, dependent: :destroy
  delegate :pet, :to => :album
  delegate :name , :to => :album ,:prefix=>true
  delegate :name , :to => "album.pet" ,:prefix=>"pet"
  delegate :user , :to => "album.pet"
  delegate :last_name , :to => "album.pet.user" ,:prefix=>"owner"
  delegate :avatar, :to => "album.pet.user", :prefix=>"owner"
  validates :image, presence: true
  validates :album, presence: true
  def comment_numbers
  	comments.count
  end
  def like_numbers
  	likes.count
  end
end
