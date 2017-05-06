class Kind < ApplicationRecord
	# ["id", "name", "created_at", "updated_at"] 
	has_many :pets, dependent: :destroy
	validates :name, presence: true, uniqueness: true
end
