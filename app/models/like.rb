class Like < ApplicationRecord
	# ["id", "user_id", "photo_id", "created_at", "updated_at"]
  belongs_to :user
  belongs_to :photo
  validates :photo,:user, presence: true
  validates :photo_id, uniqueness: {scope: :user_id,message: "Da like roi!"} 
end
