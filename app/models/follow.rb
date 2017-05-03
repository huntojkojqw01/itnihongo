class Follow < ApplicationRecord
	# ["id", "user_id", "pet_id", "created_at", "updated_at"]
  belongs_to :user
  belongs_to :pet
  has_many :photos, through: :pet
  validates :user,:pet, presence: true
end
