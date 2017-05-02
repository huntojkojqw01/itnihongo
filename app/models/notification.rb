class Notification < ApplicationRecord
	# ["id", "user_id", "recipient_id", "action", "notifiable_type", "notifiable_id", "created_at", "updated_at"]
	after_commit -> { NotificationRelayJob.perform_later(self) }
  	belongs_to :user
	belongs_to :recipient, class_name: "User"
	belongs_to :notifiable, polymorphic: true
end
