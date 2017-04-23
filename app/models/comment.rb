class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :photo
  delegate :last_name,to: :user,prefix: true
  validates :content, presence: true
end
