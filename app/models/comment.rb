class Comment < ApplicationRecord
  belongs_to :document
  belongs_to :user
  
  validates :body, :user_id, presence: true
end
