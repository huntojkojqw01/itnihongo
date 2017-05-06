class Phototag < ApplicationRecord
	# ["id", "photo_id", "tag_id", "created_at", "updated_at"]
  belongs_to :photo
  belongs_to :tag
  validates :photo,:tag,presence: true
end
