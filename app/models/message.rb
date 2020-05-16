class Message < ApplicationRecord
  belongs_to :user, class_name: :User, foreign_key: 'user_id'
  belongs_to :receiver, class_name: :User, foreign_key: 'receiver_id'
  belongs_to :friend

  validates :title, length: { maximum: 255 }
  validates :text, presence: true, length: { maximum: 1000 }
  validates :user_id, :receiver_id, :friend_id, presence: true
end
