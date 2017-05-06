class Comment < ApplicationRecord
	# ["id", "user_id", "photo_id", "content", "created_at", "updated_at"]
	include PgSearch
  multisearchable :against => :content
  belongs_to :user
  belongs_to :photo
  delegate :last_name,to: :user,prefix: true
  validates :content,:user,:photo, presence: true
end
