class Album < ApplicationRecord
  belongs_to :pet
  has_many :photos, dependent: :destroy
end
