class Pet < ApplicationRecord
  # ["id", "name", "user_id", "gender", "avatar", "kind_id", "birthday", "weight", "description", "created_at", "updated_at"]
  include PgSearch
  multisearchable :against => [:name,:description]
	mount_uploader :avatar, PhotoUploader
  belongs_to :user
  belongs_to :kind
  has_many :albums, dependent: :destroy
  has_many :photos, through: :albums
  has_many :follows, dependent: :destroy
  has_many :users, through: :follows
  validates :name, presence: true, uniqueness: true
  validates :user,:kind, presence: true
  delegate :name, to: :kind, prefix: true
  def gender_type
  	if gender==1
  		I18n.t('pettouroku.male')
  	else
  		I18n.t('pettouroku.female')
  	end
  end
  def follow_numbers
  	follows.count
  end
end
