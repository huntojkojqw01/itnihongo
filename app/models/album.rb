class Album < ApplicationRecord
  #["id", "name", "pet_id", "created_at", "updated_at"]
	include PgSearch
	multisearchable :against => :name
  belongs_to :pet
  has_many :photos, dependent: :destroy
  delegate :user, to: :pet
  validates :pet, presence: true
  validates :name, presence: true, uniqueness: true
  def first_photo
  	photos.first
  end
  def photo_numbers
  	photos.count
  end  
end
