class Comment < ApplicationRecord
  belongs_to :document
  belongs_to :user
  
  validates :body, presence: true, length: { maximum: 1000 }
  validates :user_id, :document_id, presence: true
end
