class Album < ApplicationRecord
  belongs_to :pet
  has_many :photos, dependent: :destroy
  def first_photo
  	photos.first
  end
  def photo_numbers
  	photos.count
  end  
end
