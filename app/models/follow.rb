class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  has_many :photos, through: :pet
end
