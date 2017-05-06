class Tag < ApplicationRecord
	# ["id", "name", "created_at", "updated_at"]
	include PgSearch
  	multisearchable :against => :name
  	validates :name,presence: true,uniqueness: true
end
